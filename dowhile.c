#include <tcl.h>
#include <stdio.h>


static int
do_cmd(ClientData cdata, Tcl_Interp *interp, int objc, Tcl_Obj *const objv[])
{
	int running = 1;
	int ret;

	if (objc < 4) {
		Tcl_SetObjResult(interp,
		  Tcl_NewStringObj("not enough args, must be: do BODY while COND", -1));
		return TCL_ERROR;
	}

	do {
		ret = Tcl_EvalObjEx(interp, objv[1], 0);
		switch (ret) {
		case TCL_ERROR:
		case TCL_RETURN:
			return ret;
		case TCL_BREAK:
			running = 0;
			break;
		}
		if (!running)
			break;
		ret = Tcl_ExprBooleanObj(interp, objv[3], &running);
		if (ret != TCL_OK)
			return ret;
	} while (running);

	Tcl_SetObjResult(interp, Tcl_NewStringObj("", -1));
	return TCL_OK;
}

int
Dowhile_Init(Tcl_Interp *interp)
{
	const char *ver;

	ver = Tcl_InitStubs(interp, "8.6", 0);
	if (!ver)
		return TCL_ERROR;
	if (Tcl_PkgProvide(interp, "dowhile", "1.0") != TCL_OK)
		return TCL_ERROR;

	Tcl_CreateObjCommand(interp, "do", do_cmd, NULL, NULL);

	return TCL_OK;
}
