class ReportsController < ApplicationController
  
  def index
    @report = params[:id]
    
    if @report == "ServerAssetList"
      create_server_asset_spreadsheet
    end
  end
  

  
  private
  
  def create_server_asset_spreadsheet
    
      book = Spreadsheet::Workbook.new
      
      bold_heading = Spreadsheet::Format.new(:weight => :bold, :size => 10)
      
      sun_sheet=book.create_worksheet
      hp_sheet=book.create_worksheet
      vm_sheet=book.create_worksheet
      
      sun_sheet.name  = "Sun"
      hp_sheet.name   = "HP"
      vm_sheet.name   = "Virtual Servers"
             
             
      set_column(sun_sheet,0,10,  "Server")
      set_column(sun_sheet,1,13,  "Serial")
      set_column(sun_sheet,2,9,   "Rack")  
      set_column(sun_sheet,3,11,  "Model")
      set_column(sun_sheet,4,10,  "OS")
      set_column(sun_sheet,5,78,  "CPU")
      set_column(sun_sheet,6,9,   "RAM GB")
      set_column(sun_sheet,7,11,  "Site")
      set_column(sun_sheet,8,12,  "Environment")
      set_column(sun_sheet,9,46,  "Usage")
      set_column(sun_sheet,10,15, "Project")
      set_column(sun_sheet,11,31, "Console")
      
      set_column(hp_sheet,0,10, "Server")
      set_column(hp_sheet,1,13, "Serial")
      set_column(hp_sheet,2,13, "Enclosure")
      set_column(hp_sheet,3,9,  "Rack")
      set_column(hp_sheet,4,27,  "Model")
      set_column(hp_sheet,5,10,  "OS")
      set_column(hp_sheet,6,78,  "CPU")
      set_column(hp_sheet,7,9,   "RAM GB")
      set_column(hp_sheet,8,11,  "Site")
      set_column(hp_sheet,9,12,  "Environment")
      set_column(hp_sheet,10,46,  "Usage")
      set_column(hp_sheet,11,15, "Project")
      
      set_column(vm_sheet,0,13, "Server")
      set_column(vm_sheet,1,14, "Hosted on")
      set_column(vm_sheet,2,12, "Type")
      set_column(vm_sheet,3,10, "OS")
      set_column(vm_sheet,4,14, "vCPU")
      set_column(vm_sheet,5,9,  "RAM GB")
      set_column(vm_sheet,6,15, "Project")
      set_column(vm_sheet,7,46, "Usage")
      

      
      sun_sheet_row=1
      hp_sheet_row=1
      vm_sheet_row=1
      
      @servers=Server.all.sort_by(&:name)
      @servers.each do |s|
        if s.server_model.manufacturer == "Oracle"
          sun_sheet[sun_sheet_row,0]="#{s.name}"
          sun_sheet[sun_sheet_row,1]="#{s.serial}"
          sun_sheet[sun_sheet_row,2]="#{s.server_rack.name}"
          sun_sheet[sun_sheet_row,3]="#{s.server_model.name}"
          sun_sheet[sun_sheet_row,4]="#{s.operating_system}"
          sun_sheet[sun_sheet_row,5]="#{s.cpu_number} x #{s.cpu_type}"
          sun_sheet[sun_sheet_row,6]="#{s.ram}"
          sun_sheet[sun_sheet_row,7]="#{s.datacenter.name}"
          sun_sheet[sun_sheet_row,8]="#{s.environment}"
          sun_sheet[sun_sheet_row,9]="#{s.usage}"
          sun_sheet[sun_sheet_row,10]="#{s.project.name}"
          sun_sheet[sun_sheet_row,11]="#{s.oob_address}"
          
          sun_sheet_row =  sun_sheet_row + 1
          
        elsif s.server_model.manufacturer == "HP"
          hp_sheet[hp_sheet_row,0]="#{s.name}"
          hp_sheet[hp_sheet_row,1]="#{s.serial}"
          if s.parent_id
            hp_sheet[hp_sheet_row,2]="#{s.parent.name}" 
          end
          hp_sheet[hp_sheet_row,3]="#{s.server_rack.name}"
          hp_sheet[hp_sheet_row,4]="#{s.server_model.name}"
          hp_sheet[hp_sheet_row,5]="#{s.operating_system}"
          if s.cpu_number && (s.cpu_number > 0)
            hp_sheet[hp_sheet_row,6]="#{s.cpu_number} x #{s.cpu_type}"
          end
          hp_sheet[hp_sheet_row,7]="#{s.ram}"
          hp_sheet[hp_sheet_row,8]="#{s.datacenter.name}"
          hp_sheet[hp_sheet_row,9]="#{s.environment}"
          hp_sheet[hp_sheet_row,10]="#{s.usage}"
          hp_sheet[hp_sheet_row,11]="#{s.project.name}"
          
          hp_sheet_row = hp_sheet_row + 1
          
        else
          vm_sheet[vm_sheet_row,0]="#{s.name}"
          vm_sheet[vm_sheet_row,1]="#{s.parent.name}"
          if s.server_model_id
            vm_sheet[vm_sheet_row,2]="#{s.server_model.name}"
          end
          vm_sheet[vm_sheet_row,3]="#{s.operating_system}"
          if s.cpu_number && (s.cpu_number > 0)
            vm_sheet[vm_sheet_row,4]="#{s.cpu_number} x #{s.cpu_type}"
          end
          vm_sheet[vm_sheet_row,5]="#{s.ram}"
          vm_sheet[vm_sheet_row,6]="#{s.project.name}"
          vm_sheet[vm_sheet_row,7]="#{s.usage}"
          
          vm_sheet_row = vm_sheet_row + 1
        end
      end
      
      book.write 'public/files/ServerAssetSheet.xls'
      
      send_file "public/files/ServerAssetSheet.xls", type: "application/xls"
      
      
  end
  
  # Given a sheet, set the specified column to the specified width and set the title
  def set_column(sheet, column, width, title)
    bold = Spreadsheet::Format.new(:weight => :bold, :size => 10)
    sheet.row(0).set_format(column, bold)
    sheet[0,column] = "#{title}"
    sheet.column(column).width = width
  end

  
end
