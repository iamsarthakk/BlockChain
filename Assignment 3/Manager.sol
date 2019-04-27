pragma solidity 0.5.1;
import "browser/Course.sol";

contract Manager {
    //Address of the school administrator
    address admin;

    mapping (address => int) student;
    mapping (address => bool) isStudent;
    mapping (int => bool) isCourse;
    mapping (int => Course) course;

    int rollCount = 19111000;

    //Constructor
    constructor() public{
        admin = msg.sender;
    }

    function kill() public{
        //The admin has the right to kill the contract at any time.
        //Take care that no one else is able to kill the contract
        require(msg.sender == admin);
        selfdestruct(msg.sender);

    }

    function addStudent() public{
        //Anyone on the network can become a student if not one already
        //Remember to assign the new student a unique roll number
        if(!isStudent[msg.sender]){
            student[msg.sender] = rollCount;
            isStudent[msg.sender] = true;
            rollCount++;
        }

    }

    function addCourse(int courseNo, address instructor) public{
	//Add a new course with course number as courseNo, and instructor at address instructor
        //Note that only the admin can add a new course. Also, don't create a new course if course already exists
        require(msg.sender == admin && !isCourse[courseNo]);
        course[courseNo] = new Course(courseNo, instructor, admin);


    }

    function regCourse(int courseNo) public{
        //Register the student in the course if he is a student on roll and the courseNo is valid
        if(isStudent[msg.sender] && isCourse[courseNo]){
            course[courseNo].enroll(student[msg.sender]);
        }

    }

    function getMyMarks(int courseNo) public view returns(int, int, int) {
        //Check the courseNo for validity
        //Should only work for valid students of that course
	//Returns a tuple (midsem, endsem, attendance)
	    if(isCourse[courseNo] && isStudent[msg.sender]){
	        int rol = student[msg.sender];
	        int mid = course[courseNo].getMidsemMarks(rol);
	        int end = course[courseNo].getEndsemMarks(rol);
	        int att = course[courseNo].getAttendance(rol);
	        return (mid, end, att);
	    }

    }

    function getMyRollNo() public view returns(int) {
        //Utility function to help a student if he/she forgets the roll number
        //Should only work for valid students
	//Returns roll number as int
	   if(isStudent[msg.sender]){
	       return student[msg.sender];
	   }

    }

}
