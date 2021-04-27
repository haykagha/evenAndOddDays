import UIKit

enum WeekDays: Int {
	case Monday = 0
	case Tuesday = 1
	case Wednesday = 2
	case Thursday = 3
	case Friday = 4
	case Saturday = 5
	case Sunday = 6
}

var daysOfWeek: [WeekDays] = [.Monday,.Tuesday,.Wednesday,.Thursday,.Friday,.Saturday,.Sunday]
var evenDaysOfWeek: [WeekDays] = [.Monday, .Wednesday, .Friday, .Sunday]
var oddDaysOfWeek: [WeekDays] = [.Tuesday, .Thursday, .Saturday]

var selecetedDay = WeekDays.Sunday
var resultArrayForInYears = [WeekDays]()

// Even days are: Sunday, Monday, Wensday and Friday
var isSelectedDayEvenValue: Bool = false

func isSelectedDayEven(selectedDay: WeekDays) -> Bool {
	let rawValueOfWeekDay = selectedDay.rawValue
	if rawValueOfWeekDay / 2 == 0 {
		return true
	} else {
		return false
	}
}

// this func return rest days of first week
func restDaysForFirstWeek(selectedDay: WeekDays) -> [WeekDays] {
	// Find suitable days for first week
	var resultDays = [WeekDays]()
	var index = selectedDay.rawValue
	while index < 5 {
		index += 2
		resultDays.append(WeekDays.init(rawValue: index)!)
	}
	return resultDays
}

// this func return all suitable days from second week
func restDaysFromSecondWeek() -> [WeekDays] {
	var resultDays = [WeekDays]()
	// Find suitable days for 47 weeks
	for _ in 2...48 {
		if isSelectedDayEvenValue {
			resultDays.append(contentsOf: oddDaysOfWeek)
			isSelectedDayEvenValue = false
		} else {
			resultDays.append(contentsOf: evenDaysOfWeek)
			isSelectedDayEvenValue = true
		}
	}
	return resultDays
}

// this func return all suitable days for 1 year
func resultArray(selectedDay: WeekDays) -> [WeekDays] {
	var resultArray = [WeekDays]()
	resultArray.append(contentsOf: restDaysForFirstWeek(selectedDay: selecetedDay))
	resultArray.append(contentsOf: restDaysFromSecondWeek())
	return resultArray
}


isSelectedDayEvenValue = isSelectedDayEven(selectedDay: selecetedDay)
var result = resultArray(selectedDay: selecetedDay)


print("result array is \(result))")
