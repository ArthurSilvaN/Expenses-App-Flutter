import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../components/modal_center.dart';
import '../../core/usecases/locale_usecase.dart';
import '../../core/usecases/transaction_usecase.dart';
import '../../core/util/locale_intl.dart';
import '../../models/transaction.dart';
import 'widgets/transaction_category_chart.dart';
import 'widgets/transaction_chart.dart';
import 'widgets/transaction_form.dart';
import 'widgets/transaction_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late TransactionUsecase _transactionController;
  late LocaleUseCase _localeController;
  CarouselController buttonCarouselController = CarouselController();
  late List<Transaction> transactions;

  @override
  void initState() {
    super.initState();
    _transactionController =
        Provider.of<TransactionUsecase>(context, listen: false);
    _localeController = Provider.of<LocaleUseCase>(context, listen: false);
    Future.delayed(Duration.zero, () {
      _localeController.setLocale(Localizations.localeOf(context));
    });
    transactions = _transactionController.transactions;
  }

  void _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return const TransactionForm();
      },
    );
  }

  void _openLocaleModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Languages'),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _localeController.languagesLocale.length,
                  itemBuilder: (_, index) {
                    final language = _localeController.languagesLocale[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: language.locale == _localeController.locale.value
                            ? Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7)
                            : null,
                      ),
                      child: SimpleDialogItem(
                        widget: Text(
                          language.flag,
                          style: const TextStyle(fontSize: 24),
                        ),
                        color: language.color,
                        text: language.languageName,
                        onPressed: () {
                          _localeController.setLocale(language.locale);
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.all(16),
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: () => _openTransactionFormModal(context),
          child: Text(context.locale().add),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => _openLocaleModal(context),
          ),
          const SizedBox(width: 25),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
        title: Text(context.locale().personalExpenses),
      ),
      body: ValueListenableBuilder(
        valueListenable: _transactionController.transactionsListenable,
        builder: (_, __, ___) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SingleChildScrollView(
              primary: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (_transactionController.transactions.isNotEmpty)
                    Column(
                      children: [
                        CarouselSlider(
                          items: const [
                            Center(child: TransactionChart()),
                            Center(child: CategoryChart()),
                          ],
                          options: CarouselOptions(
                            height: 400,
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                          ),
                          carouselController: buttonCarouselController,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () =>
                                  buttonCarouselController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear),
                              child: const Text('←'),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  buttonCarouselController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear,
                              ),
                              child: const Text('→'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.locale().myTransactions,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          context
                              .locale()
                              .transactionsLength(transactions.length),
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  ),
                  const TransactionList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
