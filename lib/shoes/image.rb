class Shoes
  class Image
    include Common::UIElement
    include Common::Clickable

    attr_reader :parent, :blk, :gui, :app, :file_path, :opts, :dimensions

    def initialize(app, parent, file_path, opts = {}, blk = nil)
      @app = app
      @parent = parent
      @file_path = file_path
      @opts = opts
      @blk = blk
      parent.add_child self

      @dimensions = Dimensions.new parent, opts

      @gui = Shoes.configuration.backend_for(self, @parent.gui)

      register_click(opts, blk)
    end

    def path
      @file_path
    end

    def path=(path)
      @file_path = path
      @gui.update_image
    end
  end
end
