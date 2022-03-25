import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/util/mediaquery_contex.dart';
import '../../../entities/transaction.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late final transaction = widget.transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Text(
                transaction.title.toUpperCase(),
                style: GoogleFonts.inter(fontSize: 30),
              ),
              SizedBox(
                height: context.sizeContext().height * 0.05,
              ),
              Center(
                child: Icon(
                  transaction.category!.icon,
                  color: transaction.category!.color,
                  size: context.sizeContext().height * 0.3,
                ),
              ),
              Text(
                transaction.category!.name,
                style: GoogleFonts.prompt(fontSize: 30),
              ),
              Text(
                DateFormat.yMMMMd().format(transaction.date),
                style: GoogleFonts.inter(fontSize: 20),
              ),
              SizedBox(
                height: context.sizeContext().height * 0.05,
              ),
              Text(
                NumberFormat.simpleCurrency().format(transaction.value),
                style: GoogleFonts.inter(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
