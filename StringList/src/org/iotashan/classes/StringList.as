/*
	String List
	Copyright 2008 Shannon Hicks
	http://www.iotashan.com/stringlist/
	
	Released for use under GPL v2
	http://www.gnu.org/copyleft/gpl.html
	
	Version 1.1
*/
package org.iotashan.classes
{
	/**
	 * List utility methods. Note that unlike ColdFusion, ActionScript 
	 * (and therefore these methods') indexes start at 0.
	 */
	public class StringList {
		/**
		 * Constructor method
		 */
		public function StringList() {
		}
		
		/**
		 * Converts an array of strings to a list.
		 * 
		 * @example <listing version="3.0">StringList.arrayToList(["one","two","three"]); // returns "one,two,three"</listing>
		 * @see #listToArray()
		 */
		public static function arrayToList(array:Array,delimiters:String=","):String {
			return array.join(delimiters);
		}
		
		/**
		 * Appends a value to the end of the list.
		 * 
		 * @example <listing version="3.0">StringList.listAppend("one,two,three","go!"); // returns "one,two,three,go!"</listing>
		 * @see #listPrepend()
		 */
		public static function listAppend(list:String,value:String,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			if (list.length == 0) {
				// if list is empty, value is the list
				_listArray[0] = value;
			} else {
				_listArray.splice(_listArray.length,0,value);
			}
			return _listArray.join(delimiters);
		}
		
		/**
		 * Deletes a value at the specified index.
		 * 
		 * @example <listing version="3.0">StringList.listDeleteAt("one,two,three",1); // returns "one,three"</listing>
		 * @see #listInsertAt()
		 */
		public static function listDeleteAt(list:String,index:Number,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			_listArray.splice(index,1);
			return _listArray.join(delimiters);
		}
		
		/**
		 * Returns the index of the case sensitive value in the list. Returns -1 if not found.
		 * 
		 * @example <listing version="3.0">StringList.listFind("one,two,three","two"); // returns 1</listing>
		 * @see #listFindNoCase()
		 */
		public static function listFind(list:String,value:String,delimiters:String=","):Number {
			var _listArray:Array = list.split(delimiters);
			for (var i:Number=0;i<_listArray.length;i++) {
				if(_listArray[i]==value) {
					return i;
				}
			}
			return -1;
		}
		
		/**
		 * Returns the index of the case insensitive value in the list. Returns -1 if not found.
		 * 
		 * @example <listing version="3.0">StringList.listFind("one,two,three","TwO"); // returns 1</listing>
		 * @see #listFind()
		 */
		public static function listFindNoCase(list:String,value:String,delimiters:String=","):Number {
			var _list:String = list.toLowerCase();
			var _value:String = value.toLowerCase();
			return listFind(_list,_value,delimiters);
		}
		
		/**
		 * Returns the first value in the list.
		 * 
		 * @example <listing version="3.0">StringList.listFirst("one,two,three"); // returns "one"</listing>
		 * @see #listLast()
		 * @see #listRest()
		 * @see #listMid()
		 */
		public static function listFirst(list:String,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			return _listArray[0];
		}
		
		/**
		 * Returns the value at the specified index.
		 * 
		 * @example <listing version="3.0">StringList.listGetAt("one,two,three",2); // returns "three"</listing>
		 */
		public static function listGetAt(list:String,index:Number,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			return _listArray[index];
		}
		
		/**
		 * Inserts a value at the specified index.
		 * 
		 * @example <listing version="3.0">StringList.listInsertAt("one,two,three","two and a half",2); // returns "one,two,two and a half,three"</listing>
		 * @example listDeleteAt()
		 */
		public static function listInsertAt(list:String,index:Number,value:String,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			_listArray.splice(index,0,value);
			return _listArray.join(delimiters);
		}
		
		/**
		 * Returns the last value of the list.
		 * 
		 * @example <listing version="3.0">StringList.listLast("one,two,three"); // returns "three"</listing>
		 * @see #listFirst()
		 * @see #listRest()
		 * @see #listMid()
		 */
		public static function listLast(list:String,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			return _listArray[_listArray.length-1];
		}
		
		/**
		 * Returns the number of items in the list.
		 * 
		 * @example <listing version="3.0">StringList.listLen("one,two,three"); // returns 3</listing>
		 */
		public static function listLen(list:String,delimiters:String=","):Number {
			var _listArray:Array = list.split(delimiters);
			return _listArray.length;
		}
		
		/**
		 * Adds a value to the beginning of the list.
		 * 
		 * @example <listing version="3.0">StringList.listPrepend("one,two,three","ready"); // returns "ready,one,two,three"</listing>
		 * @see #listAppend()
		 */
		public static function listPrepend(list:String,value:String,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			_listArray.splice(0,0,value);
			return _listArray.join(delimiters);
		}
		
		/**
		 * The <code>StringList.STRINGS_ONLY</code> constant 
		 * defines the value of the <code>elements</code> property of the <code>listQualify</code> 
		 * method. This will add the qualifier to all elements in the list.
		 * 
		 * @see #listQualify()
		 * @see StringList#STRINGS_ONLY
		 */
		public static const ALL_ELEMENTS:String = "all";
		
		/**
		 * The <code>StringList.STRINGS_ONLY</code> constant 
		 * defines the value of the <code>elements</code> property of the <code>listQualify</code> 
		 * method. This will only add the qualifer to elements that are strings.
		 * 
		 * @see #listQualify()
		 * @see StringList#ALL_ELEMENTS
		 */
		public static const STRINGS_ONLY:String = "char";
		
		/**
		 * Adds a qualifiying string to either all elements, or non-numeric elements.
		 * Useful for putting quotes around strings, like if you are building
		 * a CSV file.
		 * 
		 * @param elements Accepts the constants StringList.STRINGS_ONLY or StringList.ALL_ELEMENTS
		 * 
		 * @example <listing version="3.0">StringList.listQualify("one,2,three,four","'",StringList.STRINGS_ONLY); // returns "'one',2,'three','four'"</listing>
		 * 
		 * @see StringList#ALL_ELEMENTS
		 * @see StringList#STRINGS_ONLY
		 */
		public static function listQualify(list:String,qualifier:String,delimiters:String=",",elements:String="all"):String {
			var _listArray:Array = list.split(delimiters);
			var testNumber:Number;
			for (var i:Number=0;i<_listArray.length;i++) {
				if(elements == "char") {
					testNumber = Number(_listArray[i]);
					// skip numeric values
					if (isNaN(testNumber)) {
						_listArray[i] = qualifier + _listArray[i] + qualifier;
					}
				} else if (elements == "all") {
					// wrap all values
					_listArray[i] = qualifier + _listArray[i] + qualifier;
				}
			}
			return _listArray.join(delimiters);
		}
		
		/**
		 * Sets a value at the specified index.
		 * 
		 * @example <listing version="3.0">StringList.listSetAt("one,two,three","2",1); // returns "one,2,three"</listing>
		 */
		public static function listSetAt(list:String,index:Number,value:String,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			_listArray[index] = value;
			return _listArray.join(delimiters);
		}
		
		/**
		 * Converts the specified list to an array.
		 * 
		 * @example <listing version="3.0">StringList.listToArray("one,two,three"); // returns array ["one","two","three"]</listing>
		 * @see #arrayToList()
		 */
		public static function listToArray(list:String,delimiters:String=","):Array {
			var _listArray:Array = list.split(delimiters);
			return _listArray;
		}
		
		/**
		 * Returns the number of times a value is found in the list.
		 * 
		 * @example <listing version="3.0">StringList.listValueCount("one,two,three,TWO,two,Two","two"); // returns 2</listing>
		 * @see #listValueCountNoCase()
		 */
		public static function listValueCount(list:String,value:String,delimiters:String=","):Number {
			var _listArray:Array = list.split(delimiters);
			var _valuesFound:Number = 0;
			for (var i:Number=0;i<_listArray.length;i++) {
				if(_listArray[i]==value) {
					_valuesFound++;;
				}
			}
			return _valuesFound
		}
		
		/**
		 * Returns the number of times a case-insenstive value is found in the list.
		 * 
		 * @example <listing version="3.0">StringList.listValueCountNoCase("one,two,three,TWO,two,Two","two"); // returns 4</listing>
		 * @see #listValueCount()
		 */
		public static function listValueCountNoCase(list:String,value:String,delimiters:String=","):Number {
			var _list:String = list.toLowerCase();
			var _value:String = value.toLowerCase();
			return listValueCount(_list,_value,delimiters);
		}
		
		/**
		 * Changes delimiters of the list
		 * 
		 * @example <listing version="3.0">StringList.listChangeDelims("one,two,three","|"); // returns "one|two|three"</listing>
		 */
		public static function listChangeDelims(list:String,newDelimiter:String,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			return _listArray.join(newDelimiter);
		}
		
		/**
		 * Returns a list of the indexes where the substring is found. 
		 * If there are no matches, returns -1.
		 * 
		 * @example <listing version="3.0">StringList.listContains("one,two,three,TWO,two,Two","two"); // returns "1,4"</listing>
		 * @see #listContainsNoCase()
		 */
		public static function listContains(list:String,substr:String,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			var _resultArray:Array = new Array();
			var thisValue:String;
			
			for (var i:Number=0;i<_listArray.length;i++) {
				thisValue = _listArray[i]
				if (thisValue.indexOf(substr) > -1) {
					_resultArray.splice(_resultArray.length,0,i.toString());
				}
			}
			
			if (_resultArray.length == 0) {
				_resultArray[0] = -1;
			}
			
			return _resultArray.join(delimiters);
		}
		
		/**
		 * Returns a list of the indexes where the case-insenitive substring is found. 
		 * If there are no matches, returns -1.
		 * 
		 * @example <listing version="3.0">StringList.listContains("one,two,three,TWO,two,Two","two"); // returns "1,3,4,5"</listing>
		 * @see #listContainsNoCase()
		 */
		public static function listContainsNoCase(list:String,substr:String,delimiters:String=","):String {
			var _list:String = list.toLowerCase();
			var _substr:String = substr.toLowerCase();
			return listContains(_list,_substr,delimiters);
		}
		
		/**
		 * Gets a list, without its first element.
		 * 
		 * @example <listing version="3.0">StringList.listRest("one,two,three"); // returns "two,three"</listing>
		 * @see #listFirst()
		 * @see #listLast()
		 * @see #listMid()
		 */
		public static function listRest(list:String,delimiters:String=","):String {
			return listDeleteAt(list,0,delimiters);
		}
		
		/**
		 * Returns all unique elements in a list.
		 * 
		 * @example <listing version="3.0">StringList.listDistinct("one,two,three,TWO,two,Two"); // returns "one,two,three,TWO,Two"</listing>
		 */
		public static function listDistinct(list:String,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			var _resultList:String = "";
			
			for (var i:Number=0;i<_listArray.length;i++) {
				if (listFind(_resultList,_listArray[i],delimiters) == -1) {
					_resultList = listAppend(_resultList,_listArray[i],delimiters);
				}
			}
			
			return _resultList;
		}
		
		/**
		 * Returns a list of elements from the index specified through the number of elements specified.
		 * 
		 * @example <listing version="3.0">StringList.listMid("one,two,three,four",1,2); // returns "two,three"</listing>
		 * @see #listFirst()
		 * @see #listLast()
		 * @see #listRest()
		 */
		public static function listMid(list:String,start:Number,elements:Number,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			var _resultArray:Array = new Array();
			var thisValue:String;
			
			for (var i:Number=start;i<(start + elements);i++) {
				_resultArray.splice(_resultArray.length,0,_listArray[i]);
			}
			
			return _resultArray.join(delimiters);
		}
		
		/**
		 * Returns a list of elements in reverse order.
		 * 
		 * @example <listing version="3.0">StringList.listReverse("one,two,three"); // returns "three,two,one"</listing>
		 */
		public static function listReverse(list:String,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			var _resultArray:Array = new Array();
			var thisValue:String;
			
			for (var i:Number=_listArray.length-1;i>-1;i--) {
				_resultArray.splice(_resultArray.length,0,_listArray[i]);
			}
			
			return _resultArray.join(delimiters);
		}
		
		/**
		 * Returns a list with empty elements removed.
		 * 
		 * @example <listing version="3.0">StringList.listDeleteEmptyElements("one,two,,four,,,seven"); // returns "one,two,four,seven"</listing>
		 * @see #listFillEmptyElements()
		 */
		public static function listDeleteEmptyElements(list:String,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			var _resultArray:Array = new Array();
			var thisValue:String;
			
			for (var i:Number=0;i<_listArray.length;i++) {
				thisValue = _listArray[i];
				if (thisValue.length > 0) {
					_resultArray.splice(_resultArray.length,0,_listArray[i]);
				}
			}
			
			return _resultArray.join(delimiters);
		}
		
		/**
		 * Returns a list with empty elements replaced with a value.
		 * 
		 * @example <listing version="3.0">StringList.listFillEmptyElements("one,two,,four,,,seven","NULL"); // returns "one,two,NULL,four,NULL,NULL,seven"</listing>
		 * @see #listFillEmptyElements()
		 */
		public static function listFillEmptyElements(list:String,value:String,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			var _resultArray:Array = new Array();
			var thisValue:String;
			
			for (var i:Number=0;i<_listArray.length;i++) {
				thisValue = _listArray[i];
				if (thisValue.length > 0) {
					_resultArray.splice(_resultArray.length,0,thisValue);
				} else {
					_resultArray.splice(_resultArray.length,0,value);
				}
			}
			
			return _resultArray.join(delimiters);
		}
		
		/**
		 * The <code>StringList.TEXT</code> constant 
		 * defines the value of the <code>sortType</code> property of the <code>listSort</code> 
		 * method. Sorts text alphabetically, taking case into account (also known as case sensitive). 
		 * All letters of one case precede the first letter of the other case:<br>
		 * - abzABZ, if sortOrder = StringList.ASCENDING (ascending sort)<br>
		 * - ZBAzbaa, if sortOrder = "desc" (descending sort)
		 * 
		 * @see #listSort()
		 * @see StringList#TEXT_NO_CASE
		 * @see StringList#NUMERIC
		 */
		public static const TEXT:String = "text";
		
		/**
		 * The <code>StringList.TEXT_NO_CASE</code> constant 
		 * defines the value of the <code>sortType</code> property of the <code>listSort</code> 
		 * method. Sorts text alphabetically, without regard to case (also known as case-insensitive). 
		 * A letter in varying cases precedes the next letter:<br>
		 * - aAaBbBzzZ, in an ascending sort; preserves original intra-letter order<br>
		 * - ZzBbBaAa, in a descending sort; reverses original intra-letter order
		 * 
		 * @see #listSort()
		 * @see StringList#TEXT
		 * @see StringList#NUMERIC
		 */
		public static const TEXT_NO_CASE:String = "textnocase";
		
		/**
		 * The <code>StringList.NUMERIC</code> constant 
		 * defines the value of the <code>sortType</code> property of the <code>listSort</code> 
		 * method. Sorts numbers.
		 * 
		 * @see #listSort()
		 * @see StringList#TEXT
		 * @see StringList#TEXT_NO_CASE
		 */
		public static const NUMERIC:String = "numeric";
		
		/**
		 * The <code>StringList.ASCENDING</code> constant 
		 * defines the value of the <code>sortOrder</code> property of the <code>listSort</code> 
		 * method. Ascending sort order.<br>
		 * - aabzABZ or aAaBbBzzZ, depending on value of sort_type, for letters<br>
		 * - from smaller to larger, for numbers
		 * 
		 * @see #listSort()
		 * @see StringList#DECENDING
		 */
		public static const ASCENDING:String = "asc";
		
		/**
		 * The <code>StringList.DECENDING</code> constant 
		 * defines the value of the <code>sortOrder</code> property of the <code>listSort</code> 
		 * method. Decending sort order.<br>
		 * - ZBAzbaa or ZzzBbBaAa, depending on value of sort_type, for letters<br>
		 * - from larger to smaller, for numbers
		 * 
		 * @see #listSort()
		 * @see StringList#ASCENDING
		 */
		public static const DECENDING:String = "dsc";
		
		/**
		 * Sorts list elements according to a sort type and sort order.
		 * 
		 * @example <listing version="3.0">StringList.listSort("beta,alpha,delta,gamma"); // returns "alpha,beta,delta,gamma"</listing>
		 * @see #listFillEmptyElements()
		 * @see StringList#TEXT
		 * @see StringList#TEXT_NO_CASE
		 * @see StringList#NUMERIC
		 * @see StringList#ASCENDING
		 * @see StringList#DeSCENDING
		 */
		public static function listSort(list:String,sortType:String=StringList.TEXT,sortOrder:String=StringList.ASCENDING,delimiters:String=","):String {
			var _listArray:Array = list.split(delimiters);
			var tempNumber:Number;
			
			if(sortType == "numeric") {
				for (var i:Number=0;i<_listArray.length;i++) {
					tempNumber = Number(_listArray[i]);
					_listArray[i] = tempNumber;
				}
			}
			
			if (sortType == "text" && sortOrder == "asc") {
				// text, case sensitive, ascending
				_listArray.sort();
			} else if (sortType == "text" && sortOrder == "dsc") {
				// text, case sensitive, decending
				_listArray.sort(Array.DESCENDING);
			} else if (sortType == "textnocase" && sortOrder == "asc") {
				// text, case insensitive, acending
				_listArray.sort(Array.CASEINSENSITIVE);
			} else if (sortType == "textnocase" && sortOrder == "dsc") {
				// text, case insensitive, decending
				_listArray.sort(Array.CASEINSENSITIVE|Array.DESCENDING);
			} else if (sortType == "numeric" && sortOrder == "asc") {
				// newmeric, acending
				_listArray.sort(Array.NUMERIC);
			} else if (sortType == "numeric" && sortOrder == "dsc") {
				// numeric, decending
				_listArray.sort(Array.NUMERIC|Array.DESCENDING);
			}
			
			return _listArray.join(delimiters);
		}
	}
}