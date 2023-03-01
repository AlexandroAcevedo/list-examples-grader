CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

#cp student-submission/ListExamples.java ./
cp -r lib student-submission
cp -r TestListExamples.java student-submission

cd student-submission
#pwd

ls

if [[ -e ListExamples.java ]]
    then
    echo "ListExamples File Found"
    else
    echo "ListExamples File NOT Found"
fi

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
echo "Correct"
if [[ $? -eq 0 ]]
    then 
    echo "ListExamples does compile :3"
    else
    echo "ListExamples does NOT compile"
fi



java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples

if [[ $? -eq 0 ]]
    then 
    echo "ListExamplesTest does work :3"
    else
    echo "ListExamplesTest does NOT work #bozomoment"
fi

java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > JunitGrade.txt
grep -c "FAILURES!!!" JunitGrade.txt
ResultLine= grep "Tests run:" JunitGrade.txt
if [[ $? -ne 0 ]]
    then
    echo "All Junit Tests passed :3"
    else
    echo {ResultLine:11:1}
fi