require 'socket'
require 'timeout'
require 'net/http'

module Services
  class ScanService
    def call(target)
      @scan_result = { target: target, ports: {} }

      [80, 443].each do |port|
        if port_open?(target, port)
          @scan_result[:ports][port] = { status: 'open' }
          check_server(target, port)
        else
          @scan_result[:ports][port] = { status: 'close' }
        end
      end
      return @scan_result
    end

    private

    def port_open?(target, port)
      begin
        Timeout::timeout(5) do
          begin
            socket = TCPSocket.new(target, port)
            socket.close
            return true
          rescue StandardError
            return false
          end
        end
      rescue Timeout::Error
        return false
      end
    end

    def check_server(target, port)
      uri = URI.parse("http://#{target}:#{port}/")
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.path)
      response = http.request(request)

      if response.code == "200"
        @scan_result[:ports][port][:server] = response.header['Server']
      end
    end
  end
end