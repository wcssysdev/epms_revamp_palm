class HiveMasterDataHelper {
  static Future<List<T>> sortRawDataDistinct<T>(
    List<T> allData,
    {
      required String Function(T item) keySelector,
      bool ascending = true,
    }
  ) async {
    if (allData.isEmpty) return [];
    allData.sort((a,b) {
      final valA = keySelector(a);
      final valB = keySelector(b);
      return ascending ? valA.compareTo(valB) : valB.compareTo(valA);
    });

    // distinct
    final distinct = <String, T>{};
    for (var item in allData) {
      distinct[keySelector(item)] = item;
    }
    return distinct.values.toList();
  }
}
