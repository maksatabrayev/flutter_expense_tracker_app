import 'package:expenses_tracker_app/model/expense.dart';
import 'package:expenses_tracker_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expensesList, required this.removeExpense});
  final Function(Expense) removeExpense;
  final List<Expense> expensesList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(color: Colors.pink,
        margin: const EdgeInsets.all(8),),
        key: ValueKey(expensesList[index]),
        onDismissed: (direction){
          removeExpense(expensesList[index]);
        },
        child: ExpenseItem(expensesList[index]),
      ),
    );
  }
}
