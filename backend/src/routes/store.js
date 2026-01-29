const express = require('express');
const { KeyValue } = require('../models/KeyValue');

const keyValueRouter = express.Router();







keyValueRouter.post('/', async (req, res) => {
    const { key, value } = req.body;
    if (!key || !value) {
        return res.status(400).json({ error: 'Both Key and Value are required' });
    }
    try{
        const existingKey = await KeyValue.findOne({ key });
        if (existingKey) {
            return res.status(400).json({ error: 'Key already exists' });
        }
        const newKeyValue = new KeyValue({ key, value });
        await newKeyValue.save();
        return res.status(201).json({ message: 'Key-Value pair stored successfully' });
    } catch(err){
        res.status(500).json({error: 'Internal Server Error'});
    }
    return res.send('creating a key-value pair');
});











keyValueRouter.get('/:key', async (req, res) => {
    const { key } = req.params;
    try{
        const keyValue = await KeyValue.findOne({ key });
        if (!keyValue) {
            return res.status(404).json({ error: 'Key not found' });
        }
        return res.status(200).json({ key: keyValue.key, value: keyValue.value });
    } catch(err){
        res.status(500).json({message: 'Internal Server Error'});
    }
    
});









keyValueRouter.put('/:key', async(req, res) => {

    const { key } = req.params;
    const { value } = req.body;

    if (!value) {
        return res.status(400).json({ error: 'Value is required' });
    }

    try{
        const updatedKeyValue = await KeyValue.findOneAndUpdate({ key }, { value }, { new: true });
        if (!updatedKeyValue) {
            return res.status(404).json({ error: 'Key not found' });
        }
        return res.status(200).json({ message: 'Key-Value pair updated successfully', key: updatedKeyValue.key, value: updatedKeyValue.value });
    } catch(err){
        res.status(500).json({message: 'Internal Server Error'});
    }  
});    










keyValueRouter.delete('/:key', async (req, res) => {

    const { key } = req.params;

    try{
        const deletedKeyValue = await KeyValue.findOneAndDelete({ key });
        if (!deletedKeyValue) {
            return res.status(404).json({ error: 'Key not found' });
        }
        return res.status(200).json({ message: 'Key-Value pair deleted successfully' });
    } catch(err){
        res.status(500).json({message: 'Internal Server Error'});
    }
    return res.send('deleting a key-value pair')
});

module.exports = { keyValueRouter };