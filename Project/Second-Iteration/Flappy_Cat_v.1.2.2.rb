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
		while(playing == true)
			events.each { |event|
			case event
				when KeyDownEvent
				case event.key
				when K_DOWN:
					puts "event"
					if(playing == false)
						playing = true
					else
						playing = false
					end
				end
			end
			}
			while(y == 0)
				if(r == 10)
					break
				end
				truba1 = 400
				truba2 = 400
				truba3 = 400
				truba4 = 400
				truba5 = 400
				truba6 = 400
				w = (rand() * 4).to_i
				truba1_2 = stoinosti[w]
				w = (rand() * 4).to_i
				truba2_2 = stoinosti[w]
				w = (rand() * 4).to_i
				truba3_2 = stoinosti[w]
				w = (rand() * 4).to_i
				truba4_2 = stoinosti[w]
				while(r == 0)
					image.blit(screen, [0,0])
					image3.blit(screen, [truba1, truba1_2])
					screen.update
					truba1 -= 2
					sleep(0.001)
					if(truba1 < 0)
						r = 1
					end
					events.each { |event|
						case event
						when KeyDownEvent
							case event.key
							when K_DOWN:
								r = 10
							end
						end
					}
				end
				while(r == 1)
					image.blit(screen, [0,0])
					image3.blit(screen, [truba1, truba1_2])
					image3.blit(screen, [truba2, truba2_2])
					screen.update
					truba1 -= 2
					truba2 -= 2
					sleep(0.001)
					if(truba2 < -0)
						r = 2
					end
					events.each { |event|
						case event
						when KeyDownEvent
							case event.key
							when K_DOWN:
								r = 10
							end
						end
					}
				end
				while(r == 2)
					image.blit(screen, [0,0])
					image3.blit(screen, [truba1, truba1_2])
					image3.blit(screen, [truba2, truba2_2])
					image3.blit(screen, [truba3, truba3_2])
					screen.update
					truba1 -= 2
					truba2 -= 2
					truba3 -= 2
					sleep(0.001)
					if(truba3 < 0)
						r = 3
					end
					events.each { |event|
						case event
						when KeyDownEvent
							case event.key
							when K_DOWN:
								r = 10
							end
						end
					}
				end
				while(r == 3)
					image.blit(screen, [0,0])
					image3.blit(screen, [truba1, truba1_2])
					image3.blit(screen, [truba2, truba2_2])
					image3.blit(screen, [truba3, truba3_2])
					image3.blit(screen, [truba4, truba4_2])
					screen.update
					truba1 -= 2
					truba2 -= 2
					truba3 -= 2
					truba4 -= 2
					sleep(0.001)
					if(truba3 < 0)
						r = 4
					end
					events.each { |event|
						case event
						when KeyDownEvent
							case event.key
							when K_DOWN:
								r = 10
							end
						end
					}
				end
				while(r == 4)
					image.blit(screen, [0,0])
					image3.blit(screen, [truba1, truba1_2])
					image3.blit(screen, [truba2, truba2_2])
					image3.blit(screen, [truba3, truba3_2])
					image3.blit(screen, [truba4, truba4_2])
					screen.update
					truba1 -= 2
					truba2 -= 2
					truba3 -= 2
					truba4 -= 2
					if(truba1 < -1200)
						truba1 = 400
						puts "1"
						w = (rand() * 4).to_i
						truba1_2 = stoinosti[w]
					end
					if(truba2 < -1200)
						truba2 = 400
						puts "2"
						w = (rand() * 4).to_i
						truba2_2 = stoinosti[w]
					end
					if(truba3 < -1200)
						truba3 = 400
						puts "3"
						truba3_2 = stoinosti[w]
						w = (rand() * 4).to_i
					end
					if(truba4 < -1200)
						truba4 = 400
						puts "4"
						truba4_2 = stoinosti[w]
						w = (rand() * 4).to_i
					end
					events.each { |event|
						case event
						when KeyDownEvent
							case event.key
							when K_DOWN:
								r = 10
							end
						end
					}
				end
			end
			screen.update
		end
	end
