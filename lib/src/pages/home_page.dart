import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platzi/src/cubit/products_cubit.dart';
import 'package:platzi/src/models/ProductsModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getAllProducts(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductsLoadSuccess) {
              return _buildProductListUI(state.products);
            } else if (state is ProductsLoadError) {
              return Text("error");
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  _buildProductListUI(List<ProductsModel> products) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          ProductsModel item = products[index];
          return ListTile(
            leading: Image.network(item.images![index].toString()),
            title: Text(item.title.toString()),
            subtitle: Text(item.description.toString()),
          );
        });
  }
}
