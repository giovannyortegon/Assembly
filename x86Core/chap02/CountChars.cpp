#include<stdio.h>
#include<tchar.h>
#include<string>

extern "C" int CountChars_(const wchar_t *, wchar_t);

using namespace std::string_literals;

int _tmain(int argc, _TCHAR * argv[])
{
	wchar_t c;

	const wchar_t * str1 = L"Four score and seven seconds ago, ...";
	wprintf(L"\nTest string: %s\n", str1);
	c = L's';
	wprintf(L"\tSearchChar: %c Count: %d\n", c, CountChars_(str1, c));
	c = L'F';
	wprintf(L"\tSearchChar: %c Count: %d\n", c, CountChars_(str1, c));
	c = L'o';
	wprintf(L"\tSearchChar: %c Count: %d\n", c, CountChars_(str1, c));
	c = L'z';
	wprintf(L"\tSearchChar: %c Count: %d\n", c, CountChars_(str1, c));

	const wchar_t * str2 = L"Red Green Blue Cyan Magenta Yellow";
	wprintf(L"\nTest string: %s\n", str2);
	c = L'e';
	wprintf(L"\tSearchChar: %c Count: %d\n", c, CountChars_(str2, c));
	c = L'w';
	wprintf(L"\tSearchChar: %c Count: %d\n", c, CountChars_(str2, c));
	c = L'Q';
	wprintf(L"\tSearchChar: %c Count: %d\n", c, CountChars_(str2, c));
	c = L'l';
	wprintf(L"\tSearchChar: %c Count: %d\n", c, CountChars_(str2, c));

	return (0);
}
