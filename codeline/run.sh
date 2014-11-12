#/usr/bin/sh
HOME_PATH=`pwd`
TYPE=""
NUM=0
CUR=0

if [ $# -gt  0 ] ; then
	while [ $# -gt 0 ]
	do
		TYPE="."$1
		shift
		FILE=`find $HOME_PATH -name "*$TYPE"`
		if [ -z "$FILE" ] ; then
			echo "not exsist *$TYPE"
		else
			CUR=`wc -l $FILE | tail -n 1 | awk '{print $1}'`
			echo "$TYPE file code lines are $CUR"
			NUM=`expr $NUM + $CUR`
		fi
	done
else

		FILE=`find $HOME_PATH -name "*.h"`
		if [ -z "$FILE" ] ; then
			echo "not exsist *.h"
		else
			CUR=`wc -l $FILE | tail -n 1 | awk '{print $1}'`
			echo ".h file code lines are $CUR"
			NUM=`expr $NUM + $CUR`
		fi

		FILE=`find $HOME_PATH -name "*.c"`
		if [ -z "$FILE" ] ; then
			echo "not exsist *.c"
		else
			CUR=`wc -l $FILE | tail -n 1 | awk '{print $1}'`
			echo ".c file code lines are $CUR"
			NUM=`expr $NUM + $CUR`
		fi

		FILE=`find $HOME_PATH -name "*.cc"`
		if [ -z "$FILE" ] ; then
			echo "not exsist *.cc"
		else
			CUR=`wc -l $FILE | tail -n 1 | awk '{print $1}'`
			echo ".cc file code lines are $CUR"
			NUM=`expr $NUM + $CUR`
		fi

		FILE=`find $HOME_PATH -name "*.cpp"`
		if [ -z "$FILE" ] ; then
			echo "not exsist *.cpp"
		else
			CUR=`wc -l $FILE | tail -n 1 | awk '{print $1}'`
			echo ".cpp file code lines are $CUR"
			NUM=`expr $NUM + $CUR`
		fi
fi

echo ""
echo "all code lines are $NUM"


