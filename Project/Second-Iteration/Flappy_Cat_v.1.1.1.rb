require 'rubygems'	
require 'rubygame'
include Rubygame

	include Rubygame::Events

	Rubygame.init

	this_dir = File.dirname( __FILE__ )
	file = File.expand_path("Flappy_Cat_background_v.1.1.0_крайна–версия.png", this_dir)
	image = Surface.load( file )

	i = 225
	j = 425

	screen = Screen.open( image.size )
	screen.title = 'Flappy Cat '
	image.blit( screen, [0,0] )
	screen.update

	file1 = File.expand_path("firstcat.jpeg", this_dir)
	image1 = Surface.load( file1 )
	
	image1.blit(screen, [j,i])
	screen.update

	events = Rubygame::EventQueue.new

	clock = Clock.new
	clock.target_framerate = 120

	running = true
	while running
		events.each { |event|
		case event
		 when QuitEvent
			running = false
			when KeyDownEvent
			case event.key
			when K_UP: 
				u = 0
				while u <= 10
					if i > 6
						i-=6
					end
					image.blit(screen, [0,0])
					image1.blit(screen, [j,i])
					screen.update
					u+=1
					sleep(0.0001)
				end
			end
		end
		}
		if(i < 449	)
			i+=2
			image.blit(screen, [0,0])
			image1.blit(screen, [j,i])
			screen.update
			sleep(0.001)
		end	
	end
