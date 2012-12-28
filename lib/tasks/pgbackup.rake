desc "PG Backup"
namespace :pg do
	task :backup => [:environment] do
		#stamp the filename
		datestamp = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
		#
		#drop it in the db/backups directory temporarily
		backup_file = "#{Rails.root}/db/backup/unix_web_dev_#{datestamp}_dump.sql.gz"
		#
		#dump the backup and zip it up
		sh "pg_dump -h localhost -U unix_web unix_web_dev | gzip -c > #{backup_file}"
	end
end
