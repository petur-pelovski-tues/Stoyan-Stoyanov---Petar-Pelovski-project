require 'rubygems'	
	require 'rubygame'
	include Rubygame

	include Rubygame::Events

	Rubygame.init

	this_dir = File.dirname( __FILE__ )
	file = File.expand_path("Flappy_Cat_background_v.1.1.0_крайна–версия.png", this_dir)
	image = Surface.load( file )

	i = 0
	j = 0
	j2 = 33
	i2 = -7
	q = 0
	stoinosti = [0,-50,-100,-150,-249]
	truba1 = 400
	truba1_2 = 0
	truba2 = 400
	truba2_2 = 0
	truba3 = 400
	truba3_2 = 0
	truba4 = 400
	truba4_2 = 0
	machka = 0
	y = 0
	r = 0

	screen = Screen.open( image.size )
	screen.title = 'Flappy Cat '
	image.blit( screen, [0,0] )
	screen.update

	file1 = File.expand_path("kotka1001.png", this_dir)
	file2 = File.expand_path("kotka2001.png", this_dir)
	file3 = File.expand_path("truba11001.png", this_dir)
	file4 = File.expand_path("machka.png", this_dir)
	file5 = File.expand_path("machka2.png", this_dir)
	file8 = File.expand_path("play.png", this_dir)
	file9 = File.expand_path("exit.png", this_dir)
	image1 = Surface.load( file1 )
	image2 = Surface.load( file2 )
	image3 = Surface.load( file3 )
	image4 = Surface.load( file4 )
	image5 = Surface.load( file5 )
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
						if(q != 0)
							r = q
							i = 0
							j = 0
							j2 = 33
							i2 = -7
						else
							r = 0
							j = 0
							j2 = 33
							i2 = -7
						end
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
			if(r == 0)
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
			end
			while(r == 0)
				image.blit(screen, [0,0])
				image3.blit(screen, [truba1, truba1_2])
				image4.blit(screen, [i,j])
				screen.update
				if(j > 260)
					q = 0
					playing = false
					r = 10
				end
				if(truba1 < -480 && truba1 > -720)
					if(truba1_2 - j > -215 && truba1_2 - j < -125)

					else
						q = 0
						playing = false
						r = 10
					end
				end
				truba1 -= 3
				j += 3
				j2 += 3
				sleep(0.001)
				if(truba1 < 0)
					r = 1
				end
				events.each { |event|
					case event
					when KeyDownEvent
						case event.key
						when K_DOWN:
							playing = false
							q = r
							r = 10
						when K_UP:
							l = 0
							while(l <= 6)
								image.blit(screen, [0,0])
								image3.blit(screen, [truba1, truba1_2])
								image5.blit(screen, [i2,j2])
								screen.update
								if(j2 > 260)
									q = 0
									playing = false
									r = 10
								end
								if(truba1 < -480 && truba1 > -720)
									if(truba1_2 - j2 > -250 && truba1_2 - j < -10)

									else
										q = 0
										playing = false
										r = 10
									end
								end
								j -= 7
								j2 -= 7
								l += 1
								truba1 -= 3
							end
						end
					end
				}
			end
			while(r == 1)
				image.blit(screen, [0,0])
				image3.blit(screen, [truba1, truba1_2])
				image3.blit(screen, [truba2, truba2_2])
				image4.blit(screen, [i,j])
				screen.update
				if(j > 260)
					q = 0
					playing = false
					r = 10
				end
				if(truba1 < -480 && truba1 > -720)
					if(truba1_2 - j > -215 && truba1_2 - j < -125)

					else
						q = 0
						playing = false
						r = 10
					end
				end
				if(truba2 < -460 && truba2 > -720)
					if(truba2_2 - j > -215 && truba2_2 - j < -125)

					else
						q = 0
						playing = false
						r = 10
					end
				end
				truba1 -= 3
				truba2 -= 3
				j += 3
				j2 += 3
				sleep(0.001)
				if(truba2 < -0)
					r = 2
				end
				events.each { |event|
					case event
					when KeyDownEvent
						case event.key
						when K_DOWN:
							playing = false
							q = r
							r = 10
						when K_UP:
							l = 0
							while(l <= 6)
								image.blit(screen, [0,0])
								image3.blit(screen, [truba1, truba1_2])
								image3.blit(screen, [truba2, truba2_2])
								image5.blit(screen, [i2,j2])
								screen.update
								if(j2 > 260)
									q = 0
									playing = false
									r = 10
								end
								if(truba1 < -480 && truba1 > -720)
									if(truba1_2 - j2 > -250 && truba1_2 - j < -10)

									else
										q = 0
										playing = false
										r = 10
									end
								end
								if(truba2 < -460 && truba2 > -720)
									if(truba2_2 - j2 > -250 && truba2_2 - j2 < -10)

									else
										q = 0
										playing = false
										r = 10
									end
								end
								j -= 7
								j2 -= 7
								l += 1
								truba1 -= 3
								truba2 -= 3
							end
						end
					end
				}
			end
			while(r == 2)
				image.blit(screen, [0,0])
				image3.blit(screen, [truba1, truba1_2])
				image3.blit(screen, [truba2, truba2_2])
				image3.blit(screen, [truba3, truba3_2])
				image4.blit(screen, [i,j])
				screen.update
				if(j > 260)
					q = 0
					playing = false
					r = 10
				end
				if(truba1 < -480 && truba1 > -720)
					if(truba1_2 - j > -215 && truba1_2 - j < -125)

					else
						q = 0
						playing = false
						r = 10
					end
				end
				if(truba2 < -460 && truba2 > -720)
					if(truba2_2 - j > -215 && truba2_2 - j < -125)

					else
						q = 0
						playing = false
						r = 10
					end
				end
				if(truba3 < -460 && truba2 > -720)
					if(truba3_2 - j > -215 && truba3_2 - j < -125)

					else
						q = 0
						playing = false
						r = 10
					end
				end
				truba1 -= 3
				truba2 -= 3
				truba3 -= 3
				j += 3
				j2 += 3
				sleep(0.001)
				if(truba3 < 0)
					r = 3
				end
				events.each { |event|
					case event
					when KeyDownEvent
						case event.key
						when K_DOWN:
							playing = false
							q = r
							r = 10
						when K_UP:
							l = 0
							while(l <= 6)
								image.blit(screen, [0,0])
								image3.blit(screen, [truba1, truba1_2])
								image3.blit(screen, [truba2, truba2_2])
								image3.blit(screen, [truba3, truba3_2])
								image5.blit(screen, [i2,j2])
								screen.update
								if(j2 > 260)
									q = 0
									playing = false
									r = 10
								end
								if(truba1 < -480 && truba1 > -720)
									if(truba1_2 - j2 > -250 && truba1_2 - j < -10)

									else
										q = 0
										playing = false
										r = 10
										
									end
								end
								if(truba2 < -460 && truba2 > -720)
									if(truba2_2 - j2 < -250 && truba2_2 - j2 > -10)

									else
										q = 0
										playing = false
										r = 10
									end
								end
								if(truba3 < -460 && truba2 > -720)
									if(truba3_2 - j2 > -250 && truba3_2 - j2 < -10)

									else
										q = 0
										playing = false
										r = 10
									end
								end
								j -= 7
								j2 -= 7
								l += 1
								truba1 -= 3
								truba2 -= 3
								truba3 -= 3
							end
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
				image4.blit(screen, [i,j])
				screen.update
				if(j > 260)
					q = 0
					playing = false
					r = 10
				end
				if(truba1 < -480 && truba1 > -720)
					if(truba1_2 - j > -215 && truba1_2 - j < -125)

					else
						q = 0
						playing = false
						r = 10
					end
				end
				if(truba2 < -460 && truba2 > -720)
					if(truba2_2 - j > -215 && truba2_2 - j < -125)

					else
						q = 0
						playing = false
						r = 10
					end
				end
				if(truba3 < -460 && truba3 > -720)
					if(truba3_2 - j > -215 && truba3_2 - j < -125)

					else
						q = 0
						playing = false
						r = 10
					end
				end
				if(truba4 < -480 && truba4 > -720)
					if(truba2_2 - j > -215 && truba2_2 - j < -125)

					else
						q = 0
						playing = false
						r = 10
					end
				end
				truba1 -= 3
				truba2 -= 3
				truba3 -= 3
				truba4 -= 3
				j += 3
				j2 += 3
				sleep(0.001)
				if(truba3 < 0)
					r = 4
				end
				events.each { |event|
					case event
					when KeyDownEvent
						case event.key
						when K_DOWN:
							playing = false
							q = r
							r = 10
						when K_UP:
							l = 0
							while(l <= 6)
								image.blit(screen, [0,0])
								image3.blit(screen, [truba1, truba1_2])
								image3.blit(screen, [truba2, truba2_2])
								image3.blit(screen, [truba3, truba3_2])
								image3.blit(screen, [truba4, truba4_2])
								image5.blit(screen, [i2,j2])
								screen.update
								if(j2 > 260)
									q = 0
									playing = false
									r = 10
								end
								if(truba1 < -480 && truba1 > -720)
									if(truba1_2 - j2 > -250 && truba1_2 - j < -10)

									else
										q = 0
										playing = false
										r = 10
									end
								end
								if(truba2 < -460 && truba2 > -720)
									if(truba2_2 - j2 > -250 && truba2_2 - j2 < -10)

									else
										q = 0
										playing = false
										r = 10
									end
								end
								if(truba3 < -460 && truba2 > -720)
									if(truba3_2 - j2 > -250 && truba3_2 - j2 < -10)

									else
										q = 0
										playing = false
										r = 10
									end
								end
								if(truba4 < -480 && truba4 > -720)
									if(truba4_2 - j2 > -250 && truba4_2 - j2 < -10)

									else
										q = 0
										playing = false
										r = 10
									end
								end
								j -= 7
								j2 -= 7
								l += 1
								truba1 -= 3
								truba2 -= 3
								truba3 -= 3
								truba4 -= 3
							end
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
				image4.blit(screen, [i,j])
				screen.update
				truba1 -= 3
				truba2 -= 3
				truba3 -= 3
				truba4 -= 3
				if(j > 260)
					q = 0
					playing = false
					r = 10
				end
				if(truba1 < -480 && truba1 > -720)
					if(truba1_2 - j > -215 && truba1_2 - j < -125)

					else
						q = 0
						playing = false
						r = 10
					end
				end
				if(truba2 < -460 && truba2 > -720)
					if(truba2_2 - j > -215 && truba2_2 - j < -125)

					else
						q = 0
						playing = false
						r = 10
					end
				end
				if(truba3 < -460 && truba3 > -720)
					if(truba3_2 - j > -215 && truba3_2 - j < -125)

					else
						q = 0
						playing = false
						r = 10
						
					end
				end
				if(truba4 < -480 && truba4 > -720)
					if(truba4_2 - j > -215 && truba4_2 - j < -125)

					else
						q = 0
						playing = false
						r = 10
					end
				end
				j += 3
				j2 += 3
				sleep(0.001)
				if(truba1 < -1200)
					truba1 = 400
					w = (rand() * 4).to_i
					truba1_2 = stoinosti[w]
				end
				if(truba2 < -1200)
					truba2 = 400
					w = (rand() * 4).to_i
					truba2_2 = stoinosti[w]
				end
				if(truba3 < -1200)
					truba3 = 400
					truba3_2 = stoinosti[w]
					w = (rand() * 4).to_i
				end
				if(truba4 < -1200)
					truba4 = 400
					truba4_2 = stoinosti[w]
					w = (rand() * 4).to_i
				end
				events.each { |event|
					case event
					when KeyDownEvent
						case event.key
						when K_DOWN:
						playing = false
						q = r
						r = 10
						when K_UP:
							l = 0
							while(l <= 6)
								image.blit(screen, [0,0])
								image3.blit(screen, [truba1, truba1_2])
								image3.blit(screen, [truba2, truba2_2])
								image3.blit(screen, [truba3, truba3_2])
								image3.blit(screen, [truba4, truba4_2])
								image5.blit(screen, [i2,j2])
								screen.update
								if(j2 > 260)
									q = 0
									playing = false
									r = 10
								end
								if(truba1 < -480 && truba1 > -720)
									if(truba1_2 - j2 > -250 && truba1_2 - j < -10)

									else
										q = 0
										playing = false
										r = 10
										q = 0
										playing = false
										r = 10
									end
								end
								if(truba2 < -460 && truba2 > -720)
									if(truba2_2 - j2 > -250 && truba2_2 - j2 < -10)

									else
										q = 0
										playing = false
										r = 10
									end
								end
								if(truba3 < -460 && truba3 > -720)
									if(truba3_2 - j2 > -250 && truba3_2 - j2 < -10)

									else
										q = 0
										playing = false
										r = 10
										puts truba3_2 - j2
										puts j2
										puts truba3_2
										puts "mamka mu"
										sleep(45)
									end
								end
								if(truba4 < -480 && truba4 > -720)
									if(truba4_2 - j2 > -250 && truba4_2 - j2 < -10)

									else
										q = 0
										playing = false
										r = 10
									end
								end
								j -= 7
								j2 -= 7
								l += 1
								truba1 -= 3
								truba2 -= 3
								truba3 -= 3
								truba4 -= 3
							end
						end
					end
				}
			end
			screen.update
		end
	end
