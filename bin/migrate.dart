import 'package:angel_configuration/angel_configuration.dart';
import 'package:angel_migration_runner/angel_migration_runner.dart';
import 'package:angel_migration_runner/postgres.dart';
import 'package:file/local.dart';
import 'package:hn/src/models/models.dart';
import 'package:hn/src/orm.dart';

main(List<String> args) async {
  var fs = LocalFileSystem();
  var configuration = await loadStandaloneConfiguration(fs);
  var connection = await connectToPostgres(configuration);
  var migrationRunner = PostgresMigrationRunner(connection, migrations: [
    UserMigration(),
    PostMigration(),
    VoteMigration(),
    CommentMigration(),
  ]);
  return await runMigrations(migrationRunner, args);
}
