import 'package:expenses_tracker_app/widgets/chart.dart/chart.dart';
import 'package:expenses_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_tracker_app/model/expense.dart';
import 'package:expenses_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  Widget? mainContent;
  List<Expense> expenses = [
    Expense(
        title: "Flutter Course",
        amount: 19.88,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Zunrna Durum",
        amount: 6.78,
        date: DateTime.now(),
        category: Category.food)
  ];

  void openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctxt) => NewExpense(addNewExpenseToList: addNewExpenseToList),
    );
  }

  void addNewExpenseToList(Expense newExpense) {
    setState(() {
      expenses.add(newExpense);
    });
  }

  void removeExpense(Expense expense) {
    final index = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: const Text("Expense deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(label: "Undo", onPressed: (){
          setState(() {
            expenses.insert(index, expense);
          });
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (expenses.isNotEmpty) {
      mainContent =
          ExpensesList(expensesList: expenses, removeExpense: removeExpense);
    } else {
      mainContent = const Center(
        child: Text(
            "Press the button on the top right conrner to add a new expense"),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600 ? Column(
        children: [
          Chart(expenses: expenses),
          Expanded(child: mainContent!),
        ],
      ) 
      : Row(
        children: [
          Expanded(child: Chart(expenses: expenses)),
          Expanded(child: mainContent!),          
        ],
      )
    );
  }
}
