# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Blocks" do
    describe "Admin" do
      describe "blocks" do
        refinery_login_with :refinery_user

        describe "blocks list" do
          before do
            FactoryGirl.create(:block, :title => "UniqueTitleOne")
            FactoryGirl.create(:block, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.blocks_admin_blocks_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.blocks_admin_blocks_path

            click_link "Add New Block"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Blocks::Block.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Blocks::Block.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:block, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.blocks_admin_blocks_path

              click_link "Add New Block"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Blocks::Block.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:block, :title => "A title") }

          it "should succeed" do
            visit refinery.blocks_admin_blocks_path

            within ".actions" do
              click_link "Edit this block"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:block, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.blocks_admin_blocks_path

            click_link "Remove this block forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Blocks::Block.count.should == 0
          end
        end

      end
    end
  end
end
