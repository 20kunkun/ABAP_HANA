*&---------------------------------------------------------------------*
*& Report ZCG_FI_F02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCG_FI_F02.

DATA: JZ TYPE STRING.

SELECT SINGLE RIGHT( AWKEY,8 ) FROM BKPF WHERE BUKRS = 'CCGG' AND LEFT( AWKEY,2 ) = '01' INTO @JZ .

WRITE: / JZ.
