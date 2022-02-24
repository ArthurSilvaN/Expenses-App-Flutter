import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../core/usecases/transacion_usecase.dart';
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
  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _transactionController =
        Provider.of<TransactionUsecase>(context, listen: false);
  }

  void _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return const TransactionForm();
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
          child: const Text('Adicionar'),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
        title: const Text('Despesas Pessoais'),
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
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear),
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
                        const Text(
                          'Minhas Transações',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '${_transactionController.transactions.length} transações',
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
