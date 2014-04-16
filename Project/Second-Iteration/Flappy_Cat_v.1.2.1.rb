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
	stoinosti = [0,-50,-100,-150,-249,]
	truba1 = 400
	truba1_2 = 0
	truba2 = 400
	truba2_2 = 0
	truba3 = 400
	truba3_2 = 0
	truba4 = 400
	truba4_2 = 0
	y = 0
	r = 0

	screen = Screen.open( image.size )
	screen.title = 'Flappy Cat '
	image.blit( screen, [0,0] )
	screen.update

	file1 = File.expand_path("kotka1001.png", this_dir)
	file2 = File.expand_path("kotka2001.png", this_dir)
	file3 = File.expand_path("truba11001.png", this_dir)
	file8 = File.expand_path("play.png", this_dir)
	file9 = File.expand_path("exit.png", this_dir)
	image1 = Surface.load( file1 )
	image2 = Surface.load( file2 )
	image3 = Surface.load( file3 )
	image8 = Surface.load( file8 )
	image9 = Surface.load( file9 )
	
	image1.blit(screen, [j,i])
	screen.update

	events = Rubygame::EventQueue.new

	clock = Clock.new
	clock.target_framerate = 120
	p = 1
	playing = false

	running = true
	while running
		events.each { |event|
		case event
		 when QuitEvent
			running = false
			when KeyDownEvent
			case event.key
			when K_UP: 
				if(p == 1)
					p = 2
				else
					p = 1
				end
			when K_DOWN:
				if(p == 1)
					if(playing == false)
						playing = true
					else
						playing = false
					end
				else
					running = false
				end
			end
		end
		}
		if(p == 1)
			image.blit(screen, [0,0])
			image8.blit(screen, [0,0])
			screen.update
		else
			image.blit(screen, [0,0])
			image9.blit(screen, [0,0])
			screen.update
		end
			screen.update
	end
