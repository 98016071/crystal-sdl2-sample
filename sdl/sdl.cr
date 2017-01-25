require "./*"

module SDL
	def self.init(flags = LibSDL::INIT_EVERYTHING)
		if LibSDL.init(flags) != 0
			raise "Can't initialize SDL: #{error}"
		end
	end

	def self.set_video_mode(width, height, bpp, flags)
		surface = LibSDL.set_video_mode(width, height, bpp, flags)
		if surface.null?
			raise "Can't set SDL video mode: #{error}"
		end
		Surface.new(surface, width, height, bpp)
	end

	def self.create_window(x, y, w, h, flags)
		arr = [UInt8.new('K'.ord), UInt8.new('e'.ord), UInt8.new('k'.ord)]
		window = LibSDL.create_window(Pointer(UInt8).new(arr.object_id), x, y, w, h, flags)
		if window.null?
			raise "Can't create window: #{error}"
		end
		window
	end

	def self.create_renderer(window, index, flags)
		LibSDL.create_renderer(window, index, flags)
	end

	def self.get_window_surface(window)
		LibSDL.get_window_surface(window)
	end

	def self.show_cursor
		LibSDL.show_cursor LibSDL::ENABLE
	end

	def self.hide_cursor
		LibSDL.show_cursor LibSDL::DISABLE
	end

	def self.error
		String.new LibSDL.get_error
	end

	def self.ticks
		LibSDL.get_ticks
	end

	def self.quit
		LibSDL.quit
	end

	def self.poll_events
		while LibSDL.poll_event(out event) == 1
			yield event
		end
	end
end
