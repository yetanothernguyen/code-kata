def chop(element, array)
	return -1 if array.empty?
	index = array.size / 2
	while index > 0 && index < array.size - 1 do
		return index if array[index] == element

		if array[index] < element
			index += 1
			index += ((array.size - index) / 2)
		else
			index = (index / 2)
		end
	end

	return array[index] == element ? index : -1
end