class UploadController < ApplicationController

	before_filter :set_globals

	def set_globals

		@path = "/home/chrisc/Sites/unix_web/public/data/incoming/"

	end

	def index
		list
		render("list")
	end

	def new
		@files = Dir.entries(@path).sort
	end

	def create
	  
	   if ( defined? params[:file_upload][:my_file] )

      tmp = params[:file_upload][:my_file].tempfile

#		if explorer(params[:file_upload][:my_file].original_filename)
#			prefix = "public/explorers"
#			is_explorer = true
#	 	else
#			prefix = "public/data/incoming"
#			is_explorer = false
#		end

		  file = File.join('public/data/incoming', params[:file_upload][:my_file].original_filename)
		  file = file.gsub(/ /,'')
		  FileUtils.cp tmp.path, file
		
		end



#		if is_explorer
#			gunzip(file)
#		 	file = file[0..-4]
#			untar(file)
#			File.delete(file)		
#			puts Dir.entries(file[0..-5])
#			redirect_to :controller=>'explorer', :action=>'show', :search=>params[:file_upload][:my_file].original_filename[0..-8]
#		else
		redirect_to(:action => 'list')
		

#		end

  

	end

	def delete
		file = "#{@path}#{params[:file]}"
		File.delete(file)

		redirect_to :action => 'list'

	end

	def list
		#@files = Dir.entries("/home/chrisc/Sites/cmdb/public/data/incoming/").sort
		@files = Dir.entries(@path).sort
	end

	def download
		send_file "#{Rails.root}/#{params[:file_name]}"
	end

	private

	def explorer(filename)
		explorer_reg = /^explorer\.\h{8}.*-\d{4}\.\d{2}\.\d{2}\.\d{2}\.\d{2}\.tar\.gz$/
		return (explorer_reg.match(filename)) ? true : false
	end

	 def gunzip(filename)
	  command = "gunzip --force #{filename}"
	  success = system(command)
	  success && $?.exitstatus == 0
	end

	def untar(filename)
		puts system("pwd")
		command = "tar -C public/explorers -xf #{filename}"
		puts "attempting to... " + command
		success = system(command)
		success && $?.exitstatus == 0
	end



end
