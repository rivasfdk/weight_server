class SerialWeightController < ApplicationController

    def get_weight
        settings = YAML::load(File.open("#{Rails.root.to_s}/config/global.yml"))['settings']
        if settings['simulate']
            weight = rand(20000).to_s
        else
            begin
                sp = Serial.new(settings['serialport'], settings['baudrate'], settings['databits'])
                resp = sp.gets.tr("^0-9.-", '')
                resp = sp.gets.tr("^0-9.-", '')
                resp = sp.gets.tr("^0-9.-", '')
                resp = resp.to_i
                weight = resp.to_s
                sp.close
            rescue
                weight = 99999
            end
        end
        render :json => weight
    end 

end
