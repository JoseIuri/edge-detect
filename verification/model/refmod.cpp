#include <Python.h>
#include <pythonrun.h> 
#include <bytearrayobject.h> 
//#include <bits/stdc++.h>
#include <stdio.h>
#include <math.h>
#include <iostream>

typedef struct {
    unsigned int p1;
    unsigned int p2;
    unsigned int p3;
    unsigned int p4;
    unsigned int p6;
    unsigned int p7;
    unsigned int p8;
    unsigned int p9;
} DpiStructGEN;

PyObject *pBlockObjectGEN;

extern "C" void gen_init_python()
    { 
        // char pydir[400];
        
        PyObject *pBlockWrapper, *pBlockClass;

        Py_Initialize();

        // PyRun_SimpleString("import sys");
        // PyRun_SimpleString("import pathlib"); 
        // strcpy(pydir, "sys.path.append(");
        // strcat(pydir, "'../model'"); 
        // strcat(pydir, ")");
        // PyRun_SimpleString(pydir);

        pBlockWrapper = PyImport_ImportModule("refmod"); 
        // assert(pBlockWrapper != NULL);
        if(pBlockWrapper == NULL){
            std::cout << "Errei aqui" << std::endl; 
            PyErr_Print();
            exit(1); 
        }

        pBlockClass = PyObject_GetAttrString(pBlockWrapper, "refmod"); 
        assert(pBlockClass && PyCallable_Check(pBlockClass)); 



        pBlockObjectGEN = PyObject_CallObject(pBlockClass, NULL);
        if(pBlockObjectGEN  == NULL){ 
            std::cout << "Errei aqui também" << std::endl; 
            PyErr_Print(); 
            exit(1); 
        }

        Py_XDECREF(pBlockWrapper);
        Py_XDECREF(pBlockClass);

        //printf("\n PYTHON INITIALIZED\n\n"); 
    }

extern "C" void gen_set_param(DpiStructGEN *dpiStruct){
    PyObject *pBlockMethod, *pMethodReturn;
    PyObject *p1;
    PyObject *p2;
    PyObject *p3;
    PyObject *p4;
    PyObject *p6;
    PyObject *p7;
    PyObject *p8;
    PyObject *p9;

    p1 = Py_BuildValue("f", dpiStruct->p1);
    p2 = Py_BuildValue("f", dpiStruct->p2);
    p3 = Py_BuildValue("f", dpiStruct->p3);
    p4 = Py_BuildValue("f", dpiStruct->p4);
    p6 = Py_BuildValue("f", dpiStruct->p6);
    p7 = Py_BuildValue("f", dpiStruct->p7);
    p8 = Py_BuildValue("f", dpiStruct->p8);
    p9 = Py_BuildValue("f", dpiStruct->p9);

    pBlockMethod = Py_BuildValue("s", "set"); 
    assert(pBlockMethod != NULL); 

    pMethodReturn = PyObject_CallMethodObjArgs(
        pBlockObjectGEN, pBlockMethod, p1, p2, p3, p4, p6, p7, p8, p9, NULL);
    
    if(pMethodReturn == NULL){ 
        PyErr_Print(); 
        exit(1); 
    }

    Py_XDECREF(p1);
    Py_XDECREF(p2); 
    Py_XDECREF(p3); 
    Py_XDECREF(p4);  
    Py_XDECREF(p6); 
    Py_XDECREF(p7); 
    Py_XDECREF(p8);
    Py_XDECREF(p9);
}

extern "C"  int sobel(DpiStructGEN *dpiStruct){
    PyObject *pBlockMethod, *pMethodReturn;
    PyObject *p1;
    PyObject *p2;
    PyObject *p3;
    PyObject *p4;
    PyObject *p6;
    PyObject *p7;
    PyObject *p8;
    PyObject *p9;
    
    int retval;

    p1 = Py_BuildValue("f", dpiStruct->p1);
    p2 = Py_BuildValue("f", dpiStruct->p2);
    p3 = Py_BuildValue("f", dpiStruct->p3);
    p4 = Py_BuildValue("f", dpiStruct->p4);
    p6 = Py_BuildValue("f", dpiStruct->p6);
    p7 = Py_BuildValue("f", dpiStruct->p7);
    p8 = Py_BuildValue("f", dpiStruct->p8);
    p9 = Py_BuildValue("f", dpiStruct->p9);

    pBlockMethod = Py_BuildValue("s", "sobel");
    assert(pBlockMethod != NULL);

    pMethodReturn = PyObject_CallMethodObjArgs(
        pBlockObjectGEN, pBlockMethod, p1, p2, p3, p4, p6, p7, p8, p9, NULL);
    
    if(pMethodReturn == NULL){ 
        PyErr_Print(); 
        exit(1); 
    }

    retval = int(PyFloat_AsDouble(pMethodReturn));
    return retval;
}

extern "C" void gen_end_python()
    {
        Py_Finalize();
       // printf("\n PYTHON FINALIZED: GEN_DATA\n\n");
    }