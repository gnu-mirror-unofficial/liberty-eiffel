indexing
	description: "GTK+ 2 example demostrating the use of dialogs"
	copyright: "(C) 2004 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class DIALOGS_DEMO

inherit
	GTK --redefine default_rescue end
	DIALOG_FLAGS --redefine default_rescue end
	MESSAGE_TYPES --redefine default_rescue end
	BUTTONS_TYPES --redefine default_rescue end
	ANY --redefine default_rescue end
	
creation make

feature -- dialogs
	dialog: GTK_DIALOG
	label: GTK_LABEL
	message: GTK_MESSAGE_DIALOG
	file_chooser: GTK_FILE_CHOOSER_DIALOG
	--file_selection: GTK_FILE_SELECTION
	answer: INTEGER
			-- answer code of the last dialog run
	
feature -- Initialisation
	
	make is
		do
			gtk.initialize								
			run_some_dialogs
			show_file_dialogs
			run_files_dialog
		end

	run_some_dialogs is
		do
			create dialog.make
			-- Add a label
			create label.with_label ("What's your favourite programming language?")
			label.show
			dialog.vbox.pack_start_defaults (label)			
			-- Add some buttons 
			dialog.add_button("Eiffel", 10)
			dialog.add_button("C#", 11)
			dialog.add_button("Python", 12)
			dialog.add_help_button
			dialog.midscreen
			-- TODO: 10,11,12 are response_id... Check if it is clear enough.
						
			answer:=dialog.run
			inspect answer
			when 10 then print("Eiffel is a wise choice!%N")
			when 11 then print("Using C# brings you in the forest of patents. Are you sure you want to go on?")
			when 12 then print("Python is nice and easy to program, but sometimes it can be quite slow!%N")
			else 
			end
			dialog.destroy
			
			create message.new (Void, modal_dialog, info_message, ok_button,
									  "[
										eGTK are Eiffel wrappers to the
										GTK+ libraries made from the scratch
										for SmartEiffel.
										]")
			message.add_button ("Hey, why don't you help Andreas?",22)
			message.midscreen
			answer := message.run
			print("Answer is:") print(answer.out) print("%N")
			message.destroy
			
			create message.with_markup (Void, modal_dialog, question_message, yes_no_buttons,
												 "[
												  <b><big>eGTK</big> is a work in progress</b>.
												  We need volunteers. Would help us?
												  ]")
			-- message.set_modal message.add_yes_no_buttons
														
			answer := message.run
			print("Answer is:") print(answer.out) print("%N")
			message.destroy
		end

	show_file_dialogs is
		local filename: STRING
		do
			create file_chooser.make_open ("Choose the Eiffelest file you have",Void,
													 <<["Sure", {INTEGER 1}],
														["Nay",  {INTEGER 2}]>>)
			file_chooser.add_ok_cancel_buttons
			answer := file_chooser.run
			filename := file_chooser.filename
			print ("Answer is ") print (answer.out)
			if filename = Void then print (". Sadly no file choosen%N")
			else  print (". Happily you chose: '") print (filename) print("'%N")
			end
		end

	run_files_dialog is
		local filenames: G_SLIST_STRING
		do
			create file_chooser.make_open ("Choose some files",Void,Void)
			file_chooser.add_ok_cancel_buttons
			file_chooser.allow_multiple_selections
			
			answer := file_chooser.run
			print ("Answer is "+answer.out+".%N")
			filenames := file_chooser.filenames
			print (filenames.count.out + " files choosen. TODO: implement %
												  %G_SLIST_STRING.get_new_iterator%N")
			-- from filenames.start print("Choosen files are:%N") until
			-- filenames.off -- after loop print
			-- (filenames.iteration_item) print ("%N") filenames.forth
			-- end print ("No more%N")
		end

	my_rescue is
		local failing_message: GTK_MESSAGE_DIALOG; an_answer: INTEGER
		do
			print_run_time_stack
			create failing_message.new (Void, modal_dialog, error_message, ok_button,
												 "We are falling!")
			failing_message.set_title ("Program error")
			an_answer := failing_message.run
		end
end
