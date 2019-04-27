pragma solidity 0.5.1;
import "<location>/Course.sol";

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

    }
    
    
    function kill() public{
        //The admin has the right to kill the contract at any time.
        //Take care that no one else is able to kill the contract

    }
    
    function addStudent() public{
        //Anyone on the network can become a student if not one already
        //Remember to assign the new student a unique roll number

    }
    
    function addCourse(int courseNo, address instructor) public{
	//Add a new course with course number as courseNo, and instructor at address instructor
        //Note that only the admin can add a new course. Also, don't create a new course if course already exists

    }
    
    function regCourse(int courseNo) public{
        //Register the student in the course if he is a student on roll and the courseNo is valid

    }
    
    function getMyMarks(int courseNo) public view returns(int, int, int) {
        //Check the courseNo for validity
        //Should only work for valid students of that course
	//Returns a tuple (midsem, endsem, attendance)

    }
    
    function getMyRollNo() public view returns(int) {
        //Utility function to help a student if he/she forgets the roll number
        //Should only work for valid students
	//Returns roll number as int

    }
    
}
