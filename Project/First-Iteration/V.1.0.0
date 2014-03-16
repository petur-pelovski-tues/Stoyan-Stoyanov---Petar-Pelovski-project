	require 'rubygame'
	#require 'Pixel'
	include Rubygame
	
	class Pixel
	
		attr_accessor :x, :y

		def initialize(x, y, surface)
			@x, @y = x, y
			@dx, @dy = 0, 0
			@surface = surface
		end

		def up
			@dx, @dy = 0, -6
		end

		def down
			@dx, @dy = 0, 1
		end

		def left
			@dx, @dy = -1, 0
		end

		def right 
			@dx, @dy = 1, 0
		end

		def stop
			@dx = @dy = 0
		end

		def move
			tx, ty = @x + @dx, @y + @dy
			return unless (0..@surface.w-1).include? tx
			return unless (0..@surface.h-1).include? ty

			 @x, @y = tx, ty
		end

		def plot
			 @surface.set_at [@x, @y], [255, 255, 255]
		end
	end

	include Rubygame::Events

	Rubygame.init

	screen = Rubygame::Screen.set_mode [500,500]
	screen.title = 'Hello World'

	events = Rubygame::EventQueue.new
	queue = Rubygame::EventQueue.new

	clock = Clock.new
	clock.target_framerate = 120

	pix = Pixel.new(screen.w/2, screen.h/2, screen)
	pix2 = Pixel.new(screen.w/2+1, screen.h/2, screen)
	pix3 = Pixel.new(screen.w/2-1, screen.h/2, screen)
	pix4 = Pixel.new(screen.w/2, screen.h/2+1, screen)
	pix5 = Pixel.new(screen.w/2, screen.h/2-1, screen)

	running = true


	while running
		events.each { |event|
		case event
		 when QuitEvent
			running = false
			when KeyDownEvent
			case event.key
			when K_UP: 
				i = 0
				while i <= 10
					r = 0
					screen.fill  [0, 0, 0]
					pix.up
					pix2.up
					pix3.up
					pix4.up
					pix5.up
					pix.move
					pix2.move
					pix3.move
					pix4.move
					pix5.move
					pix.plot
					pix2.plot
					pix3.plot
					pix4.plot
					pix5.plot
					screen.update
					i = i + 1
					clock.tick
					#pix.stop
					sleep(0.01)
				end
			end
		end
		}
		screen.fill  [0, 0, 0]
		pix.down
		pix2.down
		pix3.down
		pix4.down
		pix5.down
		pix.move
		pix2.move
		pix3.move
		pix4.move
		pix5.move
		pix.plot
		pix2.plot
		pix3.plot
		pix4.plot
		pix5.plot
		screen.update
		clock.tick
	end

