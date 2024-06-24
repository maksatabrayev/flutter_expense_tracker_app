
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();
enum Category {travel, food, leisure, work}
const categoryIcons = {
  Category.travel :  Icons.flight_takeoff,
  Category.food : Icons.lunch_dining,
  Category.work : Icons.work,
  Category.leisure : Icons.movie
};
class Expense {
  Expense(
    {
    required this.title, 
    required this.amount, 
    required this.date,
    required this.category}
    ) : id = uuid.v4() ;
  
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  
  String get formattedDate => formatter.format(date).toString();
}

class ExpenseBucket{
  ExpenseBucket(
    {
      required this.category,
      required this.expenses,
    }
    );

  ExpenseBucket.forCategory({required List<Expense> allExpenses, required this.category}) : expenses = allExpenses.where((expense){
    return expense.category == category;
  }).toList();

  
  Category category;
  List<Expense> expenses;

  double get totalExpense{
    double sum = 0;
     
     for(final e in expenses){
        sum+= e.amount;
     }
    return sum;
  }
}