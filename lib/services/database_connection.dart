import 'package:sqflite/sqflite.dart';

import '../entities/category_registry.dart';
import '../entities/transaction.dart' as transaction_entity;
import '../models/transaction_model.dart';

const String tableExpenses = 'expenses';
const String columnId = 'id';
const String columnTitle = 'title';
const String columnValue = 'value';
const String columnDate = 'date';
const String columnCategory = 'category';

const String tableCategory = 'category';
const String columnNameCategory = 'name';
const String columnColor = 'colorCategory';
const String columnCategoryValue = 'valueCategory';

class DatabaseConneection {
  factory DatabaseConneection() {
    return _conneection ??=
        _conneection = DatabaseConneection._createInstance();
  }

  DatabaseConneection._createInstance();

  static Database? _database;
  static DatabaseConneection? _conneection;

  Future<Database> get database async => _database ??= await inializeDatabase();

  Future<Database> inializeDatabase() async {
    if (_database != null) {
      return _database!;
    }

    final dir = await getDatabasesPath();
    final path = '${dir}expenses.db';

    return openDatabase(path, version: 3, onCreate: (db, version) {
      db.execute('''
        create table $tableExpenses (
          $columnId text not null,
          $columnTitle text not null,
          $columnValue real not null,
          $columnDate text not null,
          $columnCategory text)
        ''');
      db.execute('''
        create table $tableCategory (
          $columnNameCategory text not null,
          $columnCategoryValue real not null,
          $columnColor text not null)
        ''');
    });
  }

  Future<List<transaction_entity.Transaction>> getTransactions() async {
    final List<transaction_entity.Transaction> transactions = [];
    final db = await database;
    final result = await db.query(tableExpenses);
    for (final transactionMap in result) {
      final transactionModel = TransactionModel.fromMap(transactionMap);
      transactions.add(
        transaction_entity.Transaction(
          id: transactionModel.id,
          title: transactionModel.title,
          value: transactionModel.value,
          date: transactionModel.date,
          category: transactionModel.category,
        ),
      );
    }

    return transactions;
  }

  Future<void> insertTransaction(
    transaction_entity.Transaction transaction,
  ) async {
    final transactionModel = TransactionModel(
      id: transaction.id,
      title: transaction.title,
      value: transaction.value,
      date: transaction.date,
      category: transaction.category?.toModel(),
    );

    final db = await database;
    await db.insert(tableExpenses, transactionModel.toMap());
  }

  Future<void> deleteTransactionById(String id) async {
    final db = await database;
    await db.delete(
      tableExpenses,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<List<CategoryRegistry>> getCategorys() async {
    final List<CategoryRegistry> listCategorys = [];
    final db = await database;
    final result = await db.query(tableCategory);
    for (final category in result) {
      final categoryRegistry = CategoryRegistry.fromMap(category);
      listCategorys.add(
        CategoryRegistry(
          color: categoryRegistry.color,
          name: categoryRegistry.name,
          value: categoryRegistry.value,
        ),
      );
    }
    return listCategorys;
  }

  Future<void> insertCategory(
    CategoryRegistry categoryRegistry,
  ) async {
    final db = await database;
    List<CategoryRegistry?> categorysInDatabase = [];
    categorysInDatabase = await getCategorys();
    if (categorysInDatabase
        .any((element) => element?.name == categoryRegistry.name)) {
      updateCategory(categoryRegistry);
    } else {
      await db.insert(
        tableCategory,
        categoryRegistry.toMap(),
      );
    }
  }

  Future<void> updateCategory(
    CategoryRegistry categoryRegistry,
  ) async {
    final db = await database;
    await db.update(
      tableCategory,
      categoryRegistry.toMap(),
      where: '$columnNameCategory = ?',
      whereArgs: [categoryRegistry.name],
    );
  }
}
