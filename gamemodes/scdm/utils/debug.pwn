#include <YSI\y_va>

static
	dbg_Active = true,
	dbg_Buffer[256];


stock dlog(msg[], va_args<>)
{
	if(!dbg_Active)
		return 0;

	va_formatex(dbg_Buffer, sizeof(dbg_Buffer), msg, va_start<1>);
	print(dbg_Buffer);

	return 1;
}

stock log(msg[], va_args<>)
{
	va_formatex(dbg_Buffer, sizeof(dbg_Buffer), msg, va_start<1>);
	print(dbg_Buffer);

	return 1;
}

stock toggledebug(bool:toggle)
	dbg_Active = toggle;

stock isdebug()
	return dbg_Active;
