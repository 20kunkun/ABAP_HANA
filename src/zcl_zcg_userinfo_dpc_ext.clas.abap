class ZCL_ZCG_USERINFO_DPC_EXT definition
  public
  inheriting from ZCL_ZCG_USERINFO_DPC
  create public .

public section.
protected section.

  methods USERSSET_CREATE_ENTITY
    redefinition .
  methods USERSSET_GET_ENTITYSET
    redefinition .
  methods USERSSET_GET_ENTITY
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZCG_USERINFO_DPC_EXT IMPLEMENTATION.


  method USERSSET_CREATE_ENTITY.

  DATA: LS_USER TYPE ZCG_USER.
  CALL METHOD IO_DATA_PROVIDER->READ_ENTRY_DATA
    IMPORTING
      ES_DATA = LS_USER.
  MODIFY ZCG_USER FROM LS_USER.

  endmethod.


  METHOD usersset_get_entity.

    DATA: ls_options TYPE /iwbep/s_mgw_name_value_pair.
    DATA: key_userid TYPE char10.
    LOOP AT it_key_tab INTO ls_options WHERE name = 'Userid'.
      key_userid = ls_options-value.
    ENDLOOP.
    CASE iv_entity_name.
      WHEN 'USERS'.
        SELECT SINGLE * INTO CORRESPONDING FIELDS OF er_entity
          FROM zcg_user
          WHERE userid = key_userid.
      WHEN OTHERS.
    ENDCASE.

**TRY.
*CALL METHOD SUPER->USERSSET_GET_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_request_object       =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**  IMPORTING
**    er_entity               =
**    es_response_context     =
*    .
**  CATCH /iwbep/cx_mgw_busi_exception.
**  CATCH /iwbep/cx_mgw_tech_exception.
**ENDTRY.
  ENDMETHOD.


  METHOD usersset_get_entityset.
    CASE iv_entity_name.
      WHEN 'USERS'.
        SELECT * INTO CORRESPONDING FIELDS OF TABLE et_entityset
          FROM zcg_user.
      WHEN OTHERS.
    ENDCASE.
**TRY.
*CALL METHOD SUPER->USERSSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  IMPORTING
**    et_entityset             =
**    es_response_context      =
*    .
**  CATCH /iwbep/cx_mgw_busi_exception.
**  CATCH /iwbep/cx_mgw_tech_exception.
**ENDTRY.
  ENDMETHOD.
ENDCLASS.
