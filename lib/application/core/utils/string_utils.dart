class StringUtils {
  static String getInitials(String text) => text.isNotEmpty
      ? text.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';
}
