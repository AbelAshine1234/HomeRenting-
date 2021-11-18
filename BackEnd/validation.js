const Joi = require('@hapi/joi');

// * REGISTER VALIDATION

const registervalidation = (data) => {
    const schema = Joi.object({
        name: Joi.string().min(4).required(),
        email: Joi.string().min(6).required().email(),
        password: Joi.string().min(8).required(),
        phoneNumber:Joi.string().min(10).required()
    });
    return schema.validate(data);
};

// * LOGIN VALIDATION
const loginValidation = data => {

    const schema = Joi.object({
        email: Joi.string().min(6).required().email(),
        password: Joi.string().min(8).required()

    });
    return schema.validate(data);

};

// * VALIDATING RENTAL ENTRY
const rentalValidation = data =>{

    const schema = Joi.object({
        address: Joi.string().min(4).required(),
    });
    return schema.validate(data);

};



module.exports.registervalidation = registervalidation;
module.exports.loginValidation = loginValidation;
module.exports.rentalValidation = rentalValidation;

