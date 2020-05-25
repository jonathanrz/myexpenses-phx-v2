import React, { useMemo } from "react";
import moment from "moment";
import { makeStyles } from "@material-ui/core/styles";
import Alert from "@material-ui/lab/Alert";
import FormControl from "@material-ui/core/FormControl";
import InputLabel from "@material-ui/core/InputLabel";
import {
  MuiPickersUtilsProvider,
  KeyboardDatePicker,
} from "@material-ui/pickers";
import MomentUtils from "@date-io/moment";

const useStyles = makeStyles(() => ({
  formControl: {
    width: "180px",
    display: "block",
  },
}));

function FormikDateField({ name, label, options, formik, ...props }) {
  const classes = useStyles();
  const hasError = Boolean(formik.touched[name] && formik.errors[name]);

  const value = useMemo(() => {
    console.log({ values: formik.values, name });
    if (!formik.values[name]) return null;

    return moment(formik.values[name]);
  }, [formik.values[name]]);

  return (
    <MuiPickersUtilsProvider utils={MomentUtils}>
      <FormControl className={classes.formControl}>
        <InputLabel id={`${name}_label`}>{label}</InputLabel>
        <KeyboardDatePicker
          margin="normal"
          id={name}
          format={"MM/DD/YYYY"}
          value={value}
          onChange={(date) =>
            formik.setFieldValue(name, date.format("YYYY-MM-DD"))
          }
          KeyboardButtonProps={{
            "aria-label": "change date",
          }}
        />
        {hasError ? (
          <Alert severity="error">{formik.errors[name]}</Alert>
        ) : null}
      </FormControl>
    </MuiPickersUtilsProvider>
  );
}

export default React.memo(FormikDateField);
