class Shoes
  class Arc
    include Common::UIElement
    include Common::Style
    include Common::Clickable

    attr_reader :app, :parent, :dimensions, :gui
    style_with :angle1, :angle2, :art_styles, :center, :dimensions, :radius, :wedge
    STYLES = {wedge: false}

    def initialize(app, parent, left, top, width, height, angle1, angle2, styles = {}, blk = nil)
      @app                 = app
      @parent              = parent
      @dimensions          = Dimensions.new parent, left, top, width, height, styles

      style_init(styles, angle1: angle1, angle2: angle2)
      @parent.add_child self
      @gui = Shoes.backend_for(self)

      register_click(styles, blk)
    end

    def wedge?
      wedge
    end
  end
end
