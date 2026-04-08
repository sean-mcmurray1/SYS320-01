#! /bin/bash
clear

# filling courses.txt
bash courses.bash

courseFile="courses.txt"

function displayCoursesofInst(){

echo -n "Please Input an Instructor Full Name: "
read instName

echo ""
echo "Courses of $instName :"
cat "$courseFile" | grep "$instName" | cut -d';' -f1,2 | \
sed 's/;/ | /g'
echo ""

}

function courseCountofInsts(){

echo ""
echo "Course-Instructor Distribution"
cat "$courseFile" | cut -d';' -f7 | \
grep -v "/" | grep -v "\.\.\." | \
sort -n | uniq -c | sort -n -r 
echo ""

}

function coursesInLocation(){

echo -n "Please Input a location example- JOYC 310: "
read locName

echo ""
echo "Courses in $locName :"
cat "$courseFile" | grep "$locName" | cut -d';' -f1,2,5,6,7 | \
sed 's/;/ | /g'
echo "" 

}

function coursesWithSeats(){

echo -n "Please Input a subject example- SYS: "
read subjectName

echo ""
echo "Courses with seats in $subjectName :"
cat "$courseFile" | grep "$subjectName" | awk -F';' '$4 > 0' | \
sed 's/;/ | /g'
echo ""
}
# TODO - 1
# Make a function that displays all the courses in given location
# function dislaplays course code, course name, course days, time, instructor
# Add function to the menu
# Example input: JOYC 310
# Example output: See the screenshots in canvas

# TODO - 2
# Make a function that displays all the courses that has availability
# (seat number will be more than 0) for the given course code
# Add function to the menu
# Example input: SEC
# Example output: See the screenshots in canvas

while :
do
	echo ""
	echo "Please select and option:"
	echo "[1] Display courses of an instructor"
	echo "[2] Display course count of instructors"
	echo "[3] Display courses in a specific location"
	echo "[4] Display courses in a subject with available seats"
	echo "[5] Exit"

	read userInput
	echo ""

	if [[ "$userInput" == "5" ]]; then
		echo "Goodbye"
		break

	elif [[ "$userInput" == "1" ]]; then
		displayCoursesofInst

	elif [[ "$userInput" == "2" ]]; then
		courseCountofInsts

	elif [[ "$userInput" == "3" ]]; then
		coursesInLocation

	elif [[ "$userInput" == "4" ]]; then
		coursesWithSeats

	else
		echo "Invalid input, Please select a number between 1 and 5"

	fi
done
