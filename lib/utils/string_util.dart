class StringUtil {
  static String formatCount(int count) {
    if (count < 10000) {
      return count.toString();
    } else if (count < 100000000) {
      return '${(count / 10000).toStringAsFixed(1)}万';
    } else {
      return '${(count / 100000000).toStringAsFixed(1)}亿';
    }
  }
}
