enum LogLevel {
  debug('DEBUG'),
  info('INFO'),
  warning('WARNING'),
  error('ERROR');

  final String name;

  const LogLevel(this.name);
}
