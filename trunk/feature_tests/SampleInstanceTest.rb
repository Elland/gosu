require '../lib/gosu'

class Test < Gosu::Window
  def initialize 
    super(640, 480, false)
    @sample = Gosu::Sample.new(self, "media/Sample.wav")
    @instance = @sample.play(1, 1, true)
  end

  def update
    self.caption = "Playing: #{@instance.playing?}, paused: #{@instance.paused?}"
    #@instance = @sample.play if not @instance.playing? and not @instance.paused?
    @instance.pan = Gosu::random(-1, 1) if button_down?(Gosu::KbTab)
  end
  
  def button_down(id)
    close if id == Gosu::KbEscape
    @instance.stop if id == Gosu::KbSpace
    @instance.speed = 0.5 if id == Gosu::KbLeft
    @instance.pause if id == Gosu::KbDown
    @instance.resume if id == Gosu::KbUp
  end
end

Test.new.show
