const fetch = require('node-fetch');
const functions = require('firebase-functions');
const stream = require('getstream');

/// -----------------------------------
/// getConfigs
/// -----------------------------------

/// -----------------------------------
/// Auth0 env variables
/// -----------------------------------

const getAuth0UserInfo = async (authorization) => {
  /// -----------------------------------
  /// getAuth0UserInfo
  /// -----------------------------------
};

const getAuth0ManagementTokens = async () => {
  /// -----------------------------------
  /// getAuth0ManagementTokens
  /// -----------------------------------
};

const getAuth0UserPermissions = async (profile, managementInfo) => {
  /// -----------------------------------
  /// getAuth0UserPermissions
  /// -----------------------------------
};

const getAuth0UserRoles = async (profile, managementInfo) => {
  /// -----------------------------------
  /// getAuth0UserRoles
  /// -----------------------------------
};

const stripAllExceptNumbers = (str) => {
  return str.replace(/[^\d]/g, '');
};

module.exports.userProfile = functions.https.onRequest(async (request, response) => {
  /// -----------------------------------
  /// getUserProfile
  /// -----------------------------------
});

const getAuth0Users = async (managementInfo) => {
  /// -----------------------------------
  /// getAuth0Users
  /// -----------------------------------
};

module.exports.availableCustomerService = functions.https.onRequest(async (request, response) => {
  /// -----------------------------------
  /// availableCustomerService
  /// -----------------------------------
});
