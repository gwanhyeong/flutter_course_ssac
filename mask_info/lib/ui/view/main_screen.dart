import 'package:flutter/material.dart';
import 'package:mask_info/ui/widget/store_list_item.dart';
import 'package:mask_info/view_model/mask_store_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MaskStoreViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 판매 장소 ${viewModel.storeList.length}곳'),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.fetch();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _buildBody(viewModel),
    );
  }

  Widget _buildBody(MaskStoreViewModel viewModel) {
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return viewModel.storeList.isNotEmpty
        ? ListView.builder(
            itemCount: viewModel.storeList.length,
            itemBuilder: (BuildContext context, int index) {
              return StoreListItem(store: viewModel.storeList[index]);
            },
          )
        : const Center(child: Text('데이터가 없습니다.'));
  }
}
