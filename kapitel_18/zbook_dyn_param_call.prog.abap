REPORT zbook_demo_dyn_param_call.
PARAMETERS p_type TYPE char40 DEFAULT 'ZBOOK_TICKET-STATUS'.
PARAMETERS p_data TYPE char40.

AT SELECTION-SCREEN.

  DELETE FROM MEMORY ID 'Kochbuch'.

  SUBMIT zbook_dyn_param
    WITH p_type = p_type
    WITH p_data = p_data
     VIA SELECTION-SCREEN
     AND RETURN.


  IMPORT data TO p_data FROM MEMORY ID 'Kochbuch'.
  IF sy-subrc > 0.
    MESSAGE s000(oo) WITH 'Eingabe abgebrochen'.
  ENDIF.
