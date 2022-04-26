CLASS lhc_YMDB_I_CONFIG DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING keys FOR ACTION config~create.
    METHODS get_global_features FOR GLOBAL FEATURES
      IMPORTING REQUEST requested_features FOR Config RESULT result.

ENDCLASS.

CLASS lhc_YMDB_I_CONFIG IMPLEMENTATION.

  METHOD create.

    MODIFY ENTITY IN LOCAL MODE ymdb_i_config
    CREATE
    SET FIELDS WITH VALUE
        #( ( Uname = cl_abap_context_info=>get_user_technical_name(  ) ) ).

  ENDMETHOD.

  METHOD get_global_features.

    READ ENTITY IN LOCAL MODE ymdb_i_config
    ALL FIELDS WITH VALUE #( ( Uname = cl_abap_context_info=>get_user_technical_name(  ) ) )
    RESULT DATA(user).

    result = VALUE #( %action-create = COND #( WHEN user is INITIAL
                                               THEN if_abap_behv=>fc-o-enabled
                                               ELSE if_abap_behv=>fc-o-disabled ) ).

  ENDMETHOD.

ENDCLASS.
