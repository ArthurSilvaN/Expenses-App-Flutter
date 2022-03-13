import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../core/usecases/transaction_usecase.dart';
import '../../core/util/locale_intl.dart';

import '../../services/auth_service.dart';
import 'components/drawer.dart';
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
  late final TransactionUsecase _transactionController =
      Provider.of<TransactionUsecase>(context, listen: false);

  late final AuthService _authService =
      Provider.of<AuthService>(context, listen: false);

  late final size = MediaQuery.of(context).size;

  final globalKey = GlobalKey<ScaffoldState>();

  CarouselController buttonCarouselController = CarouselController();

  void _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const TransactionForm(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      endDrawer: const DrawerHome(),
      floatingActionButton: SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _openTransactionFormModal(context),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.add_box_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.15),
        child: Container(
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: 'Olá, ',
                  children: [
                    TextSpan(
                      text: '${_authService.user!.displayName}',
                    )
                  ],
                ),
              ),
              subtitle: const Text(
                'Bem vindo ao seu app de finanças',
              ),
              trailing: GestureDetector(
                onTap: () => globalKey.currentState!.openEndDrawer(),
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(
                        _authService.user!.photoUrl.toString(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _transactionController.transactionsListenable,
        builder: (_, __, ___) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
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
                          height: size.height * 0.4,
                          viewportFraction: 1,
                        ),
                        carouselController: buttonCarouselController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            color: Theme.of(context).colorScheme.primary,
                            onPressed: () =>
                                buttonCarouselController.previousPage(
                              duration: const Duration(milliseconds: 300),
                            ),
                            icon: const Icon(Icons.keyboard_arrow_left),
                          ),
                          IconButton(
                            color: Theme.of(context).colorScheme.primary,
                            onPressed: () => buttonCarouselController.nextPage(
                                duration: const Duration(milliseconds: 300)),
                            icon: const Icon(Icons.keyboard_arrow_right),
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
                        context.locale().transactionsLength(
                              _transactionController.transactions.length,
                            ),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                ),
                const TransactionList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
