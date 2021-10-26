import 'package:flutter/material.dart';
import 'package:mask_info/model/mask_store.dart';

class StoreListItem extends StatelessWidget {
  final MaskStore store;

  const StoreListItem({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                store.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(store.addr),
              trailing: _buildRemainStatWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRemainStatWidget() {
    var remainStat = '판매중지';
    var description = '';
    var color = Colors.red;

    switch (store.remainStat) {
      case MaskStoreStock.plenty:
        remainStat = '충분';
        description = '100개 이상';
        color = Colors.green;
        break;
      case MaskStoreStock.some:
        remainStat = '보통';
        description = '30 ~ 100개';
        color = Colors.orange;
        break;
      case MaskStoreStock.few:
        remainStat = '부족';
        description = '2 ~ 30개';
        color = Colors.red;
        break;
      case MaskStoreStock.empty:
        remainStat = '소진임박';
        description = '1개 이하';
        color = Colors.grey;
        break;
    }

    return SizedBox(
      width: 70.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            remainStat,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (description.isNotEmpty)
            Text(
              description,
              style: TextStyle(
                color: color,
              ),
            ),
        ],
      ),
    );
  }
}
