class SDL::Renderer
	def initialize(window, index = -1, flags = 0)
		@renderer = LibSDL.create_renderer(window, index, flags)
	end

	def render_clear
		LibSDL.render_clear(@renderer)
	end

	def render_present
		LibSDL.render_present(@renderer)
	end

	def set_color(r, g, b)
		LibSDL.set_render_draw_color(@renderer, r, g, b, 0)
	end

	def draw_point(x, y)
		LibSDL.render_draw_point(@renderer, x, y)
	end
	
	def draw_pixel(x, y, r, g, b)
		set_color(r, g, b)
		draw_point(x, y)
	end
end
