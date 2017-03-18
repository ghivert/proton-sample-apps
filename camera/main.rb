require 'proton'
require 'proton/browser_window'

@app = Proton.app

@app.on 'window-all-closed' do
  @app.quit if Process.platform != 'darwin'
end

@app.on 'ready' do
  Global.main_window = (Proton::BrowserWindow.new width: 800, height: 600).tap do |window|
    window.load_url "file://#{`__dirname`}/index.html"
    window.on 'closed' do
      Global.main_window = nil
    end
  end
end
