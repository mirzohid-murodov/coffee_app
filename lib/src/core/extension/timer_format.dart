extension TimerFormat on num {
  String formatTime(int totalSeconds) {
    final duration = Duration(seconds: totalSeconds);
    final int minutes = duration.inMinutes;
    final int seconds = totalSeconds % 60;

    final String minutesString = '$minutes'.padLeft(2, '0');
    final String secondsString = '$seconds'.padLeft(2, '0');

    return '$minutesString:$secondsString';
  }
}