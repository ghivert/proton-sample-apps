require 'proton'
require 'proton/browser_window'

@app = Proton.app

@app.on_window_all_closed do
  @app.quit if Process.platform != 'darwin'
end

@app.on_ready do
  Global.main_window = (Proton::BrowserWindow.new width: 800, height: 600).tap do |window|
    window.load_url "file://#{`__dirname`}/index.html"
    window.on_closed do
      Global.main_window = nil
    end
  end
end
