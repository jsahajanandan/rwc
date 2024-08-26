require 'rails_helper'

RSpec.describe UsersController, type: :request do
    let(:valid_attributes) {
        { first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com' }
    }

    let(:invalid_attributes) {
        { first_name: '', last_name: '', email: '' }
    }

    describe "GET #index" do
        it "returns a successful response" do
            get users_path
            expect(response).to be_successful
        end

        it "assigns all users as @users" do
            user = User.create! valid_attributes
            get users_path
            expect(assigns(:users)).to eq([user])
        end
    end

    describe "GET #show" do
        it "returns a successful response" do
            user = User.create! valid_attributes
            get user_path(user)
            expect(response).to be_successful
        end

        it "assigns the requested user as @user" do
            user = User.create! valid_attributes
            get user_path(user)
            expect(assigns(:user)).to eq(user)
        end
    end

    describe "GET #new" do
        it "returns a successful response" do
            get new_user_path
            expect(response).to be_successful
        end

        it "assigns a new user as @user" do
            get new_user_path
            expect(assigns(:user)).to be_a_new(User)
        end
    end

    describe "GET #edit" do
        it "returns a successful response" do
            user = User.create! valid_attributes
            get edit_user_path(user)
            expect(response).to be_successful
        end

        it "assigns the requested user as @user" do
            user = User.create! valid_attributes
            get edit_user_path(user)
            expect(assigns(:user)).to eq(user)
        end
    end

    describe "POST #create" do
        context "with valid parameters" do
            it "creates a new User" do
                expect {
                    post users_path, params: { user: valid_attributes }
                }.to change(User, :count).by(1)
            end

            it "redirects to the created user" do
                post users_path, params: { user: valid_attributes }
                expect(response).to redirect_to(user_path(User.last))
            end
        end

        context "with invalid parameters" do
            it "does not create a new User" do
                expect {
                    post users_path, params: { user: invalid_attributes }
                }.to change(User, :count).by(0)
            end

            it "returns a successful response (i.e. to display the 'new' template)" do
                post users_path, params: { user: invalid_attributes }
                expect(response).to be_successful
            end
        end
    end

    describe "PATCH #update" do
        context "with valid parameters" do
            let(:new_attributes) {
                { first_name: 'Jane' }
            }

            it "updates the requested user" do
                user = User.create! valid_attributes
                patch user_path(user), params: { user: new_attributes }
                user.reload
                expect(user.first_name).to eq('Jane')
            end

            it "redirects to the user" do
                user = User.create! valid_attributes
                patch user_path(user), params: { user: new_attributes }
                expect(response).to redirect_to(user_path(user))
            end
        end

        context "with invalid parameters" do
            it "returns a successful response (i.e. to display the 'edit' template)" do
                user = User.create! valid_attributes
                patch user_path(user), params: { user: invalid_attributes }
                expect(response).to be_successful
            end
        end
    end

    describe "DELETE #destroy" do
        it "destroys the requested user" do
            user = User.create! valid_attributes
            expect {
                delete user_path(user)
            }.to change(User, :count).by(-1)
        end

        it "redirects to the users list" do
            user = User.create! valid_attributes
            delete user_path(user)
            expect(response).to redirect_to(users_path)
        end
    end
end